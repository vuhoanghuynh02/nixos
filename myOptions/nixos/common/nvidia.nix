# nvidia.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
  cudaSupport = pkgs.config.cudaSupport;
  nvidiaEnabled = cfg.nvidia.enable;
  nvidiaDisabled = cfg.nvidia.disable;
  specialisationEnabled = cfg.specialisation.nvidia.enable;
in {
  options.myOptions = {
    nvidia = {
      enable = mkOption {
        type = types.bool;
        default = cudaSupport;
      };
      disable = mkOption {
        type = types.bool;
        default = !nvidiaEnabled;
      };
    };
    specialisation.nvidia.enable = mkOption {
      type = types.bool;
      default = cudaSupport;
    };
  };

  config = {
    nix.settings = mkIf cudaSupport {
      substituters = [
        "https://cuda-maintainers.cachix.org"
      ];
      trusted-public-keys = [
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };

    #################################################################################

    services.xserver.videoDrivers = mkIf nvidiaEnabled ["nvidia"];
    hardware.nvidia.prime.sync.enable = mkDefault true;
    hardware.nvidia.nvidiaSettings = mkDefault false;
    hardware.nvidia-container-toolkit.enable = mkIf (nvidiaEnabled && config.virtualisation.podman.enable) (mkDefault true);

    #################################################################################

    boot.blacklistedKernelModules = mkIf nvidiaDisabled [
      "nouveau"
      "nvidia"
    ];

    #################################################################################

    assertions = [
      {assertion = !(nvidiaEnabled && nvidiaDisabled);}
    ];

    myOptions.nvidia = mkIf specialisationEnabled {
      disable = true;
      enable = false;
    };
    specialisation.nvidia = mkIf specialisationEnabled {
      configuration.myOptions.nvidia = {
        disable = mkForce false;
        enable = mkForce true;
      };
    };
  };
}
