# server_shared.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./base_shared.nix
    ./server_packages.nix
  ];
}
