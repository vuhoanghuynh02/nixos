# default.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./autoClean.nix
    # default.nix
    ./misc.nix
    ./nix.nix
    ./programs.nix
  ];
}
