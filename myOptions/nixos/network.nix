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
  };
}
