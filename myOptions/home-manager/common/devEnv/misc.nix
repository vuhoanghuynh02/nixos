# misc.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  options.myOptions.devEnv.enable = mkOption {
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.devEnv.enable) {
    programs.direnv = {
      enable = mkDefault true;
      nix-direnv.enable = mkDefault true;
    };

    home.packages = with pkgs; [
      github-desktop
    ];
  };
}
