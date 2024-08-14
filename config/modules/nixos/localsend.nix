# localsend.nix

{ config, lib, pkgs, ... }:
{
  networking.firewall = {
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };
}
