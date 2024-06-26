# activitywatch.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.services.activitywatch = lib.mkIf (config.myOptions.hyprland.enable) {
    enable = lib.mkDefault true;
    watchers.awatcher.package = pkgs.awatcher;
  };
}
