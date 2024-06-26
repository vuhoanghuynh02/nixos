# server_shared.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./base_shared.nix
    ./syncthing-firewall.nix
    ./podman.nix
    ./server/openssh.nix
    ./server/cloudflared.nix
    ./server/nextcloud.nix
    # ./server/portfolio.nix
  ];

  services.getty.autologinUser = config.myOptions.userName;
  services.logind.lidSwitch = "lock";
}
