# nixos_home-manager_shared.nix

{ config, lib, pkgs, ... }:
{
  options.custom = {
    configHostName = lib.mkOption {
      type = lib.types.singleLineStr;
    };
    userName = lib.mkOption {
      default = config.custom.configHostName;
      type = lib.types.singleLineStr;
    };
    homeDirectory = lib.mkOption {
      default = "/home/${config.custom.userName}";
      type = lib.types.singleLineStr;
    };
    cleanAfter = lib.mkOption {
      default = "56"; # in days
      type = lib.types.singleLineStr;
      description = ''
        The number of days in string format. 
      '';
    };
  };
}
