# vm_host.nix

{ config, lib, pkgs, ... }:
{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.${config.custom.userName}.extraGroups = [ "libvirtd" ];
}
