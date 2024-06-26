# nvidia.nix
{
  config,
  lib,
  pkgs,
  ...
}: let
  specialisationEnabled = config.myOptions.nvidia.specialisation.enable;
in {
  options.myOptions.nvidia = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    disable = lib.mkOption {
      type = lib.types.bool;
      default = specialisationEnabled;
    };
    specialisation.enable = lib.mkOption {
      type = lib.types.bool;
      default = pkgs.config.cudaSupport;
    };
  };

  config = let
    nvidiaEnabled = config.myOptions.nvidia.enable;
    nvidiaDisabled = config.myOptions.nvidia.disable;
  in {
    assertions = [
      {assertion = !specialisationEnabled || nvidiaDisabled;}
    ];

    nix.settings = lib.mkIf pkgs.config.cudaSupport {
      substituters = [
        "https://cuda-maintainers.cachix.org"
      ];
      trusted-public-keys = [
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };

    boot.blacklistedKernelModules = lib.mkIf nvidiaDisabled ["nouveau"];

    services.xserver.videoDrivers = lib.mkIf nvidiaEnabled ["nvidia"];
    hardware.nvidia.prime.sync.enable = lib.mkDefault true;
    hardware.nvidia.nvidiaSettings = lib.mkDefault false;
    hardware.nvidia-container-toolkit.enable = lib.mkIf (nvidiaEnabled && config.virtualisation.podman.enable) (lib.mkDefault true);

    myOptions.nvidia.enable = lib.mkIf specialisationEnabled false;
    # specialisation.nvidia.configuration.myOptions.nvidia.enable = lib.mkIf specialisationEnabled (lib.mkForce true);
    specialisation.nvidia = lib.mkIf specialisationEnabled {
      configuration.myOptions.nvidia.enable = lib.mkForce true;
    };
  };
}
