# option.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.myOptions = {
    tunnelID = lib.mkOption {
      type = lib.types.singleLineStr;
    };
    domainName = lib.mkOption {
      type = lib.types.singleLineStr;
      default = "vuhoanghuynh02.xyz";
    };
  };
}
