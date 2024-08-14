# podman.nix

{ config, lib, pkgs, ... }:
{
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
      dockerSocket.enable = true;
    };
  };
  users.users.${config.custom.userName}.extraGroups = [ "podman" ];
}
