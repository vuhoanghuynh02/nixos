# localsend.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.networking.firewall = lib.mkIf (config.myOptions.localsend.enable) {
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };
}
