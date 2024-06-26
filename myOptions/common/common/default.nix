# default.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  imports = [
    ./autoClean.nix
    # default.nix
    ./fonts.nix
    ./hosts.nix
    ./misc.nix
    ./nix.nix
    ./packages.nix
  ];
}
