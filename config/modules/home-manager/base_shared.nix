# base_shared.nix

{ config, lib, pkgs, ... }:
{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  # You can update fHome Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
  imports = [
    ../nixos_home-manager_shared.nix
    ./options.nix
    ./base_packages.nix
    ./shell.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    options = "--delete-older-than ${config.custom.cleanAfter}d";
    frequency = "Mon *-*-8..14";
  };

  home.username = config.custom.userName;
  home.homeDirectory = config.custom.homeDirectory;
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      download = "${config.custom.homeDirectory}/Downloads";
      documents = config.xdg.userDirs.download;
      music = config.xdg.userDirs.download;
      pictures = config.xdg.userDirs.download;
      videos = config.xdg.userDirs.download;
    };
  };
}
