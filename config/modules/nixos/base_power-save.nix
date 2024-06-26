# base_power-save.nix

{ ... }:
{
  services.power-profiles-daemon.enable = false; # conflict wit tlp
  services.thermald.enable = false; # https://linrunner.de/tlp/faq/powercon.html
  services.tlp = {
    enable = true;
    settings = {
      # https://linrunner.de/tlp/settings/battery.html
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;
      START_CHARGE_THRESH_BAT1 = 75;
      STOP_CHARGE_THRESH_BAT1 = 80;
      RESTORE_THRESHOLDS_ON_BAT = 1;
      NATACPI_ENABLE = 1;
      TPACPI_ENABLE = 1;
      TPSMAPI_ENABLE = 1;
      #
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 1;
      #
      USB_BLACKLIST_PHONE = 1;
    };
  };
}
