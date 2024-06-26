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
    ../../common/24.11
    # default.nix
    ./temp.nix
  ];
}
