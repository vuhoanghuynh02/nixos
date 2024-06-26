# flameshot.nix
{
  config,
  lib,
  ...
}: {
  services.flameshot = {
    settings = {
      General = {
        autoCloseIdleDaemon = lib.mkDefault true;
        filenamePattern = lib.mkDefault "%F_%T";
        savePath = lib.mkDefault config.xdg.userDirs.download;
        showMagnifier = lib.mkDefault true;
        showStartupLaunchMessage = lib.mkDefault false;
        squareMagnifier = lib.mkDefault false;
      };
    };
  };
}
