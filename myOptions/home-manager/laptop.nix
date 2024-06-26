# laptop.nix
{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.myOptions;
in {
  config = lib.mkIf (cfg.laptop.enable) {
    home.packages = with pkgs; [
      resources
    ];
    services.safeeyes.enable = lib.mkDefault true;
  };
}
