# packages.nix
{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.myOptions;
in {
  options.myOptions = {
    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      description = ''
        Packages to install.
      '';
    };
    localsend.enable = lib.mkOption {
      type = lib.types.bool;
      default = cfg.laptop.enable;
    };
    redroid.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
