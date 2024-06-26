# openssh.nix

{ config, lib, pkgs, ... }:
{
  users.users."${config.myOptions.userName}".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF4QzECA4NjxAi9RFqfhwBYWj1JRBAqRmC6YOesLRmQQ vincent"
  ];

  services.openssh = {
    enable = true;
    # require public key authentication for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    ##
  };

  services.cloudflared.tunnels."${config.myOptions.tunnelID}".ingress = {
    "ssh.${config.myOptions.domainName}" = "ssh://localhost:22";
  };
}
