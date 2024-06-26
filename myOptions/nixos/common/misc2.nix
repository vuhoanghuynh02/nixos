# misc2.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = mkIf cfg.hosts.vincent-home.enable {
    services.flatpak.enable = true; # for zen-browser
    programs.virt-manager.enable = true; # for Bliss OS
  };
}
