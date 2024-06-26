# compatibility.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  options.myOptions.compatibility = {
    agent = mkOption {
      type = types.singleLineStr;
      default = "agent";
    };
    edit_prediction_provider = mkOption {
      type = types.singleLineStr;
      default = "edit_prediction_provider";
    };
  };
}
