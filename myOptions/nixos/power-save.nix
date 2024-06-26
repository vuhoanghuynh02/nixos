# power-save.nix
{
  config,
  lib,
  ...
}: {
  config = {
    assertions = [
      {
        assertion =
          !config.services.tlp.enable
          || (!config.services.power-profiles-daemon.enable && !config.services.thermald.enable && !config.powerManagement.powertop.enable);
      }
    ];
    services.power-profiles-daemon.enable = lib.mkIf (config.services.tlp.enable) false; # See https://linrunner.de/tlp/faq/ppd.html#does-power-profiles-daemon-conflict-with-tlp
    services.thermald.enable = lib.mkIf (config.services.tlp.enable) (lib.mkDefault false); # See https://linrunner.de/tlp/faq/powercon.html#high-fan-speed
    powerManagement.powertop.enable = lib.mkIf (config.services.tlp.enable) (lib.mkDefault false);

    services.tlp = {
      enable = lib.mkDefault true;
      settings = {
        # See https://linrunner.de/tlp/settings/battery.html
        START_CHARGE_THRESH_BAT0 = lib.mkDefault 75;
        STOP_CHARGE_THRESH_BAT0 = lib.mkDefault 80;
        START_CHARGE_THRESH_BAT1 = lib.mkDefault 75;
        STOP_CHARGE_THRESH_BAT1 = lib.mkDefault 80;
        RESTORE_THRESHOLDS_ON_BAT = lib.mkDefault 1;
        #
        TLP_DEFAULT_MODE = lib.mkDefault "BAT";
        TLP_PERSISTENT_DEFAULT = lib.mkDefault 1;
        #
        USB_EXLUDE_PHONE = lib.mkDefault 1;
      };
    };
  };
}
