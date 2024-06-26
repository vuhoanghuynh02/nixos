# autoClean.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  options.myOptions.autoClean = {
    frequency = mkOption {
      type = types.singleLineStr;
      default = "*-01,03,05,07,09,11-02";
    };
    age = mkOption {
      default = "56";
      type = types.singleLineStr;
      description = "The number of days in string format.";
    };
  };

  config.nix.gc = {
    automatic = mkDefault true;
    options = "--delete-older-than ${cfg.autoClean.age}d";
  };
}
