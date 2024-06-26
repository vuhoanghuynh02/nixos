# network.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  options.myOptions.network.hasIpv6Internet = mkOption {
    type = types.bool;
    default = false;
  };

  config = {
    networking = {
      hostName = mkDefault "nixos";
      networkmanager.enable = mkDefault true;
    };
  };
}
