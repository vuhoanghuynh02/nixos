# misc.nix
{
  config,
  lib,
  ...
}: {
  options.myOptions = let
    cfg = config.myOptions;
  in {
    userName = lib.mkOption {
      type = lib.types.singleLineStr;
    };
    homeDirectory = lib.mkOption {
      type = lib.types.singleLineStr;
      default = "/home/${cfg.userName}";
    };
    laptop.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    server.enable = lib.mkOption {
      type = lib.types.bool;
      default = !cfg.laptop.enable;
    };
    sound.enable = lib.mkOption {
      type = lib.types.bool;
      default = cfg.laptop.enable;
    };
    bluetooth.enable = lib.mkOption {
      type = lib.types.bool;
      default = cfg.laptop.enable;
    };
  };
}
