# cosmic.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config.services = mkIf (cfg.hosts.vincent-home.enable || cfg.hosts.vincent-work.enable || cfg.hosts.sophie.enable) {
    desktopManager.cosmic.enable = mkDefault true;
    displayManager.cosmic-greeter.enable = mkDefault config.services.desktopManager.cosmic.enable;
  };
}
