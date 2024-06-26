# ecryptfs.nix

{ config, pkgs, lib, ... }:
{
  # https://nixos.wiki/wiki/ECryptfs
  programs.ecryptfs.enable = true;
  security.pam.enableEcryptfs = true;
  boot.kernelModules = [ "ecryptfs" ];
}
