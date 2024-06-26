# misc.nix
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
    userName = mkOption {
      type = types.singleLineStr;
    };
    homeDirectory = mkOption {
      type = types.singleLineStr;
      default = "/home/${cfg.userName}";
    };
  };
  config = {
    programs.command-not-found.enable = mkDefault false;
  };
}
