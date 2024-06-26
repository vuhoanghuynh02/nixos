# zed.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  myOptions.compatibility.agent = "assistant";
  myOptions.compatibility.edit_prediction_provider = "inline_completion_provider";
}
