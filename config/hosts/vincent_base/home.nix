# home.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./nixos_home-manager_shared.nix
    ../../modules/home-manager/desktop_shared.nix
    ../../modules/home-manager/vincent_shell.nix
    ../../modules/home-manager/vincent_packages.nix
    ../../modules/home-manager/vincent_dev.nix
    ../../modules/home-manager/vincent_ssh-client.nix
  ];
}
