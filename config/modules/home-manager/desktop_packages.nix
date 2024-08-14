# desktop_packages.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./flameshot.nix
    ./fonts.nix
    ./vscodium.nix
  ];

  programs.btop.enable = true;
}
