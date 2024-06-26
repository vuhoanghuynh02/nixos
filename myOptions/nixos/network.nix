# network.nix
{
  config,
  lib,
  ...
}: {
  options.myOptions.network.hasIpv6Internet = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = {
    networking = {
      hostName = lib.mkDefault "nixos";
      networkmanager.enable = lib.mkDefault true;
    };

    services.kubo.enable = lib.mkDefault true;
    users.users.${config.myOptions.userName}.extraGroups = lib.mkIf (config.services.kubo.enable) [config.services.kubo.group];
  };
}
