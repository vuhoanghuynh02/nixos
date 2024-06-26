# misc.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.myOptions.devEnv.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf (config.myOptions.devEnv.enable) {
    programs.direnv = {
      enable = lib.mkDefault true;
      nix-direnv.enable = lib.mkDefault true;
    };

    home.packages = with pkgs; [
      github-desktop
    ];
  };
}
