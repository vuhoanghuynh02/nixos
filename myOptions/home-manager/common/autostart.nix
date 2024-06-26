# autostart.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  # please use xdg.autostart someday
  xdg.configFile = {
    "autostart/pomatez.desktop".source = mkDefault "${cfg.homeDirectory}/.nix-profile/share/applications/pomatez.desktop";
    "autostart/appflowy.desktop".source = mkDefault "${pkgs.appflowy}/share/applications/appflowy.desktop";
  };
}
