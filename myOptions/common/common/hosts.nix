# hosts.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions.hosts;
  toInt = b:
    if b
    then 1
    else 0;
  hostEnabled = ((toInt cfg.vincent-home.enable) + (toInt cfg.vincent-work.enable) + (toInt cfg.sophie.enable) + (toInt cfg.homeserver.enable)) == 1;
in {
  options.myOptions.hosts = {
    vincent-home.enable = mkOption {
      type = types.bool;
      default = false;
    };
    vincent-work.enable = mkOption {
      type = types.bool;
      default = false;
    };
    sophie.enable = mkOption {
      type = types.bool;
      default = false;
    };
    homeserver.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = {
    assertions = [
      {
        assertion = hostEnabled;
        message = "You must have exactly one host enabled.";
      }
    ];
    myOptions.userName =
      if cfg.vincent-home.enable
      then "vincent"
      else if cfg.vincent-work.enable
      then "vincent"
      else if cfg.sophie.enable
      then "sophie"
      else if cfg.homeserver.enable
      then "homeserver"
      else null;
  };
}
