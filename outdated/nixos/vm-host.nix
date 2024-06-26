# vm-host.nix

{ config, lib, pkgs, ... }:
{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.${config.myOptions.userName}.extraGroups = [ "libvirtd" ];
}
