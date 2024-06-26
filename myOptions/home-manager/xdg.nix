# xdg.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    home.username = config.myOptions.userName;
    home.homeDirectory = config.myOptions.homeDirectory;
    xdg = {
      enable = lib.mkDefault true;
      userDirs = {
        enable = lib.mkDefault true;
        download = lib.mkDefault "${config.myOptions.homeDirectory}/download";
        documents = lib.mkDefault config.xdg.userDirs.download;
        music = lib.mkDefault config.xdg.userDirs.download;
        pictures = lib.mkDefault config.xdg.userDirs.download;
        videos = lib.mkDefault config.xdg.userDirs.download;
      };
      configHome = lib.mkDefault "${config.myOptions.homeDirectory}/.config";

      configFile."nixpkgs".source = ../../.config/nixpkgs;
    };
  };
}
