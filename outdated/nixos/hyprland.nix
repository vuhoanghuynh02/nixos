# hyprland.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.myOptions.hyprland.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf (config.myOptions.hyprland.enable) {
    programs.hyprland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    services.displayManager.ly.enable = true;
    services.gnome.gnome-keyring.enable = true;
  };
}
