# sound.nix
{
  config,
  lib,
  ...
}: let
  cfg = config.myOptions;
in {
  config = lib.mkIf (cfg.sound.enable) {
    programs.mpv.enable = lib.mkDefault true;
    services.easyeffects.enable = lib.mkIf (cfg.laptop.enable) (lib.mkDefault true);
  };
}
