# desktop_packages.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./localsend.nix
  ];

  services.flatpak.enable = true;
  programs.dconf.enable = true;
}
