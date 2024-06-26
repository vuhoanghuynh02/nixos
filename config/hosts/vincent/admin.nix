{ config, ... }:
{
  programs.ssh.matchBlocks.server = {
    hostname = "192.168.1.15";
    user = "server";
    identitiesOnly = true;
    identityFile = "${config.home.homeDirectory}/.ssh/server";
  };
}
