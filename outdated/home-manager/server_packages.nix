# server_packages.nix

{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    syncthing
    podman-compose
  ];
}
