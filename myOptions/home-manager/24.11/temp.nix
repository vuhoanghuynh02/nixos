# temp.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  options.services.ollama.enable = mkOption {
    type = types.bool;
    default = false;
  };
}
