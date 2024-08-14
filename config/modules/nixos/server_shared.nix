# server_shared.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./base_shared.nix
    ./server_ssh.nix
    ./server_cloudflared.nix
    ./podman.nix
    ./server_supabase.nix
  ];

  system.autoUpgrade = {
    operation = "switch"; # for potential security update
    allowReboot = true;
    rebootWindow.lower = "01:00";
    rebootWindow.upper = "02:00";
  };
  services.getty.autologinUser = config.custom.userName;

  services.logind.lidSwitch = "lock";
}
