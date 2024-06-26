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
    ../common
    # default.nix
  ];
}
