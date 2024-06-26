# packages.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  options.myOptions = {
    localsend.enable = mkOption {
      type = types.bool;
      default = cfg.hosts.vincent-home.enable || cfg.hosts.vincent-work.enable || cfg.hosts.sophie.enable;
    };
    packages = mkOption {
      type = types.listOf types.package;
      default = [];
    };
  };
}
