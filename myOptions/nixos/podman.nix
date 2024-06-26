# podman.nix
{
  config,
  lib,
  ...
}: {
  config = {
    virtualisation.podman = {
      dockerCompat = lib.mkDefault true;
      defaultNetwork.settings.dns_enabled = lib.mkDefault true;
      dockerSocket.enable = lib.mkDefault true;
    };
    users.users.${config.myOptions.userName}.extraGroups =
      lib.mkIf (config.virtualisation.podman.enable)
      [
        config.systemd.sockets.podman.socketConfig.SocketGroup
      ];
  };
}
