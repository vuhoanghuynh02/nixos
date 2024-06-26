# pomatez.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  options.myOptions.pomatez_appimage = mkOption {
    type = types.singleLineStr;
  };

  config = mkIf (cfg.laptop.enable) {
    xdg.desktopEntries.pomatez = {
      name = mkDefault "Pomatez";
      exec = mkDefault "${getExe pkgs.appimage-run} ${cfg.pomatez_appimage}";
    };
    xdg.configFile."autostart/pomatez.desktop".source = mkDefault "${cfg.homeDirectory}/.nix-profile/share/applications/pomatez.desktop";
  };
}
