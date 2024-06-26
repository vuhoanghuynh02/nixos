# ipfs.nix
{
  config,
  lib,
  ...
}: {
  config = {
    services.kubo.enable = lib.mkDefault true;
    services.kubo.settings.Addresses.API = lib.mkDefault "/ip4/127.0.0.1/tcp/5001";
    users.users.${config.myOptions.userName}.extraGroups = lib.mkIf (config.services.kubo.enable) [config.services.kubo.group];
  };
}
