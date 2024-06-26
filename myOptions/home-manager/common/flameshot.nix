# flameshot.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  services.flameshot = {
    settings = {
      General = {
        autoCloseIdleDaemon = mkDefault true;
        filenamePattern = mkDefault "%F_%T";
        savePath = mkDefault config.xdg.userDirs.download;
        showMagnifier = mkDefault true;
        showStartupLaunchMessage = mkDefault false;
        squareMagnifier = mkDefault false;
      };
    };
  };
}
