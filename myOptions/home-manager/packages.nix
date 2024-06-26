# packages.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  config = let
    cfg = config.myOptions;
  in {
    programs.home-manager.enable = lib.mkDefault true;
    home.packages = with pkgs; [
      trash-cli
    ];

    services = lib.mkIf (cfg.laptop.enable) {
      easyeffects.enable = lib.mkDefault cfg.sound.enable;
      safeeyes.enable = lib.mkDefault true;
    };
  };
}
