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

  config = mkIf (cfg.hosts.vincent-home.enable || cfg.hosts.vincent-work.enable || cfg.hosts.sophie.enable) {
    xdg.desktopEntries.pomatez = {
      name = mkDefault "Pomatez";
      exec = mkDefault "${getExe pkgs.appimage-run} ${cfg.pomatez_appimage}";
    };
  };
}
