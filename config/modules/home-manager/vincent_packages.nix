# vincent_packages.nix

{ config, lib, pkgs, ... }:
{
  programs = {
    ssh.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    gitui.enable = true;

    obs-studio.enable = true;
  };

  home.packages = with pkgs; [
    tldr
    syncthing
    appimage-run

    vlc
    easyeffects
    kdePackages.okular
    libreoffice-qt6-still
    kdePackages.kmenuedit

    anki
    brave
    nextcloud-client
    kdePackages.kalarm
  ];
}
