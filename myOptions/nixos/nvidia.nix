# nvidia.nix
{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.myOptions;
  cudaSupport = pkgs.config.cudaSupport;
  nvidiaEnabled = cfg.nvidia.enable;
  nvidiaDisabled = cfg.nvidia.disable;
  specialisationEnabled = cfg.specialisation.nvidia.enable;
in {
  options.myOptions = {
    nvidia = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = cudaSupport;
      };
      disable = lib.mkOption {
        type = lib.types.bool;
        default = !nvidiaEnabled;
      };
    };
    specialisation.nvidia.enable = lib.mkOption {
      type = lib.types.bool;
      default = cudaSupport;
    };
  };

  config = {
    nix.settings = lib.mkIf cudaSupport {
      substituters = [
        "https://cuda-maintainers.cachix.org"
      ];
      trusted-public-keys = [
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };

    #################################################################################

    services.xserver.videoDrivers = lib.mkIf nvidiaEnabled ["nvidia"];
    hardware.nvidia.prime.sync.enable = lib.mkDefault true;
    hardware.nvidia.nvidiaSettings = lib.mkDefault false;
    hardware.nvidia-container-toolkit.enable = lib.mkIf (nvidiaEnabled && config.virtualisation.podman.enable) (lib.mkDefault true);

    #################################################################################

    boot.blacklistedKernelModules = lib.mkIf nvidiaDisabled [
      "nouveau"
      "nvidia"
    ];

    #################################################################################

    assertions = [
      {assertion = !(nvidiaEnabled && nvidiaDisabled);}
    ];

    myOptions.nvidia = lib.mkIf specialisationEnabled {
      disable = true;
      enable = false;
    };
    specialisation.nvidia = lib.mkIf specialisationEnabled {
      configuration.myOptions.nvidia = {
        disable = lib.mkForce false;
        enable = lib.mkForce true;
      };
    };
  };
}
