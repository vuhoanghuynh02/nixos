# ipfs.nix
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
    services.kubo.enable = mkDefault true;
    services.kubo.settings.Addresses.API = mkDefault "/ip4/127.0.0.1/tcp/5001";
    users.users.${cfg.userName}.extraGroups = mkIf (config.services.kubo.enable) [config.services.kubo.group];
  };
}
