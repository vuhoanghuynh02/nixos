# programs.nix
{
  config,
  lib,
  ...
}: {
  options.myOptions = {
    cosmic.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.myOptions.laptop.enable;
    };
    localsend.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.myOptions.laptop.enable;
    };
    redroid.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    syncthing.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
