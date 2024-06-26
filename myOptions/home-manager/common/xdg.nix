# xdg.nix
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
    home.username = cfg.userName;
    home.homeDirectory = cfg.homeDirectory;
    xdg = {
      enable = mkDefault true;
      userDirs = {
        enable = mkDefault true;
        download = mkDefault "${cfg.homeDirectory}/download";
        documents = mkDefault config.xdg.userDirs.download;
        music = mkDefault config.xdg.userDirs.download;
        pictures = mkDefault config.xdg.userDirs.download;
        videos = mkDefault config.xdg.userDirs.download;
      };
      configHome = mkDefault "${cfg.homeDirectory}/.config";
    };
  };
}
