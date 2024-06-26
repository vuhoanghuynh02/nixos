# laptop.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = mkIf (cfg.hosts.vincent-home.enable || cfg.hosts.vincent-work.enable || cfg.hosts.sophie.enable) {
    home.packages = with pkgs; [
      resources
    ];
    services.safeeyes.enable = mkDefault true;
  };
}
