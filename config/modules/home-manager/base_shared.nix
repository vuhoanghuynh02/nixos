# base_shared.nix

{ config, ... }:
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
    ../options.nix
    ./base_git.nix
    ./base_packages.nix
    ./base_fish.nix
  ];

  nixpkgs.config.allowUnfree = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    options = "--delete-older-than ${config.custom.cleanAfter}d";
    frequency = "monthly";
  };

  home.username = config.custom.userName;
  home.homeDirectory = "/home/${config.custom.userName}";
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      download = "${config.home.homeDirectory}/Downloads";
      documents = config.xdg.userDirs.download;
      music = config.xdg.userDirs.download;
      pictures = config.xdg.userDirs.download;
      videos = config.xdg.userDirs.download;
    };
  };
}
