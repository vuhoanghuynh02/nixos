# podman.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = {
    virtualisation.podman = {
      dockerCompat = mkDefault true;
      defaultNetwork.settings.dns_enabled = mkDefault true;
      dockerSocket.enable = mkDefault true;
    };
    users.users.${cfg.userName}.extraGroups =
      mkIf (config.virtualisation.podman.enable)
      [
        config.systemd.sockets.podman.socketConfig.SocketGroup
      ];
  };
}
