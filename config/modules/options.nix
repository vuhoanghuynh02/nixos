# options.nix

{ lib, ... }:
{
  options = {
    custom.userName = lib.mkOption { };
    custom.cleanAfter = lib.mkOption { default = "56"; }; # in days
  };
}
