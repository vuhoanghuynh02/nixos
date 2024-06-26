# power-save.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = {
    assertions = [
      {
        assertion =
          !config.services.tlp.enable
          || (!config.services.power-profiles-daemon.enable && !config.services.thermald.enable && !config.powerManagement.powertop.enable);
      }
    ];
    services.power-profiles-daemon.enable = mkIf (config.services.tlp.enable) false; # See https://linrunner.de/tlp/faq/ppd.html#does-power-profiles-daemon-conflict-with-tlp
    services.thermald.enable = mkIf (config.services.tlp.enable) (mkDefault false); # See https://linrunner.de/tlp/faq/powercon.html#high-fan-speed
    powerManagement.powertop.enable = mkIf (config.services.tlp.enable) (mkDefault false);

    services.tlp = {
      enable = mkDefault true;
      settings = {
        # See https://linrunner.de/tlp/settings/battery.html
        START_CHARGE_THRESH_BAT0 = mkDefault 75;
        STOP_CHARGE_THRESH_BAT0 = mkDefault 80;
        START_CHARGE_THRESH_BAT1 = mkDefault 75;
        STOP_CHARGE_THRESH_BAT1 = mkDefault 80;
        RESTORE_THRESHOLDS_ON_BAT = mkDefault 1;
        #
        TLP_DEFAULT_MODE = mkDefault "BAT";
        TLP_PERSISTENT_DEFAULT = mkDefault 1;
        #
        USB_EXLUDE_PHONE = mkDefault 1;
      };
    };
  };
}
