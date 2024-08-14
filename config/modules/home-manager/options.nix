# options.nix

{ config, lib, pkgs, ... }:
{
  options.custom = {
    fishMainConfig = lib.mkOption {
      type = lib.types.str;
      default = '''';
    };
  };
}
