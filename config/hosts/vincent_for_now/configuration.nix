# configuration.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./nixos_home-manager_shared.nix
    ../vincent_base/configuration.nix
    ../../modules/nixos/vietnamese.nix
    ../../modules/nixos/podman.nix
  ];
}
