# autoClean.nix
{
  config,
  lib,
  ...
}: {
  options.myOptions.autoClean = {
    frequency = lib.mkOption {
      type = lib.types.singleLineStr;
      default = "*-01,03,05,07,09,11-02";
    };
    age = lib.mkOption {
      default = "56";
      type = lib.types.singleLineStr;
      description = "The number of days in string format.";
    };
  };

  config.nix.gc = {
    automatic = lib.mkDefault true;
    options = "--delete-older-than ${config.myOptions.autoClean.age}d";
  };
}
