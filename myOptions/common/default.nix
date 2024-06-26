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
    ./fonts.nix
    ./misc.nix
    ./nix.nix
    ./packages.nix
  ];
}
