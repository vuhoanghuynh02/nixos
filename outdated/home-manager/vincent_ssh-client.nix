# ssh-client.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.ssh.matchBlocks = {
    server = {
      hostname = "ssh.vuhoanghuynh02.xyz";
      user = "server";
      identityFile = "${config.myOptions.homeDirectory}/.ssh/server";
      proxyCommand = "${pkgs.cloudflared}/bin/cloudflared access ssh --hostname ssh.vuhoanghuynh02.xyz";
    };
  };
}
