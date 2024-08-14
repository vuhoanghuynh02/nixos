# flameshot.nix

{ config, lib, pkgs, ... }:
{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        autoCloseIdleDaemon = true;
        checkForUpdates = false;
        filenamePattern = "%F_%T";
        savePath = config.xdg.userDirs.download;
        showMagnifier = true;
        showStartupLaunchMessage = false;
        squareMagnifier = false;
      };
    };
  };
}
