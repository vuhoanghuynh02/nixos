# server_cloudflared.nix

{ config, lib, pkgs, ... }:
let
  domainName = "vuhoanghuynh02.xyz";
  tunnelID = "e9e5eff5-77ab-4973-848d-4e8f6e28461d";
in
{
  systemd.services."cloudflared-tunnel-${tunnelID}".serviceConfig.RestartSec = 10;
  services.cloudflared = {
    enable = true;
    user = config.custom.userName;
    tunnels = {
      "${tunnelID}" = {
        credentialsFile = "${config.custom.homeDirectory}/.cloudflared/${tunnelID}.json";
        default = "http_status:404";
        ingress = {
          "ssh.${domainName}" = "ssh://localhost:22";
          "pomodoro.${domainName}" = "hello_world";
          # "${domainName}" = "hello_world";
          # "chatbot.${domainName}" = "hello_world";
          # "simpleecommerce.${domainName}" = "hello_world";
          # "simpleblog.${domainName}" = "hello_world";
          # "supabase.${domainName}" = "hello_world";
        };
      };
    };
  };
}
