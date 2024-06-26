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
    ../../common/25.05
    # default.nix
  ];
}
