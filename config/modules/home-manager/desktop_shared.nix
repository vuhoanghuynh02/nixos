# desktop_shared.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./base_shared.nix
    ./desktop_packages.nix
    ./kde.nix
  ];

  dconf.enable = true;
}
