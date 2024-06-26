# localsend.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config.networking.firewall = mkIf (cfg.localsend.enable) {
    allowedTCPPorts = [53317];
    allowedUDPPorts = [53317];
  };
}
