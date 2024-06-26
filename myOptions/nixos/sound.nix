# sound.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.myOptions = {
    sound.disable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    specialisation.sound.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = let
    cfg = config.myOptions;
    specialisationEnabled = cfg.specialisation.sound.enable;
    soundEnabled = cfg.sound.enable;
    soundDisabled = cfg.sound.disable;
  in {
    services.pipewire = {
      enable = soundEnabled;
      pulse.enable = lib.mkDefault soundEnabled;
    };
    hardware.pulseaudio.enable = lib.mkDefault false;
    # services.pulseaudio.enable = lib.mkDefault false;

    programs.dconf.enable = lib.mkIf (cfg.laptop.enable && soundEnabled) (lib.mkDefault true); # for home-manager services.easyeffects.enable

    #################################################################################

    boot.blacklistedKernelModules = lib.mkIf soundDisabled ["snd_hda_intel"];

    #################################################################################

    # assertions = [
    #   {assertion = !(soundEnabled && soundDisabled);} # 25.05
    # ];

    myOptions.sound = lib.mkIf specialisationEnabled {
      disable = true;
      enable = false;
    };
    specialisation.sound = lib.mkIf specialisationEnabled {
      configuration.myOptions.sound = {
        disable = lib.mkForce false;
        enable = lib.mkForce true;
      };
    };
  };
}
