# cloudflared.nix

{ config, lib, pkgs, ... }:
{
  systemd.services."cloudflared-tunnel-${config.myOptions.tunnelID}".serviceConfig.RestartSec = 10;
  services.cloudflared = {
    enable = true;
    user = config.myOptions.userName;
    tunnels = {
      "${config.myOptions.tunnelID}" = {
        credentialsFile = "${config.myOptions.homeDirectory}/.cloudflared/${config.myOptions.tunnelID}.json";
        default = "http_status:404";
      };
    };
  };
}
