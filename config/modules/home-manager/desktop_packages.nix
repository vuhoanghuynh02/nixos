# desktop_packages.nix

{ config, ... }:
{
  imports = [
    ./vscodium.nix
    ./alacritty.nix
    ./flameshot.nix
    ./fonts.nix
  ];
}
