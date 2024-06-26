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
    home.packages = with pkgs;
      [
        resources
        nautilus
        kdePackages.okular
        kdePackages.gwenview
        kdePackages.kalarm

        networkmanagerapplet
        rofi-wayland
        hyprsunset
        brightnessctl
        swww

        waybar
      ]
      ++ lib.optionals config.myOptions.bluetooth.enable [
        overskride
      ]
      ++ lib.optionals config.myOptions.sound.enable [
        vlc
      ];

    home.shellAliases."paper-switch" = "swww img $(find ${config.myOptions.homeDirectory}/Nextcloud/archive/wallpaper/ -type f | shuf -n 1)";

    xdg.configFile = {
      "hypr".source = ../../.config/hypr;
      # "eww-bar".source = ../../.config/eww-bar;
    };
    # programs.eww = {
    #   enable = true;
    #   configDir = ../../.config/eww;
    # };
  };
}
