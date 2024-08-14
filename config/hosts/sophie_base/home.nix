# home.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./nixos_home-manager_shared.nix
    ../../modules/home-manager/desktop_shared.nix
  ];
}
