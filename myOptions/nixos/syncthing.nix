# syncthing.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.networking.firewall = lib.mkIf (config.myOptions.syncthing.enable) {
    allowedTCPPorts = [ 22000 ];
    allowedUDPPorts = [
      21027
      22000
    ];
  };
}
