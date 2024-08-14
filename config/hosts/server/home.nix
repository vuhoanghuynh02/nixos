# home.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./nixos_home-manager_shared.nix
    ../../modules/home-manager/server_shared.nix
  ];
}
