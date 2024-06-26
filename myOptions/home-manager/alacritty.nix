# alacritty.nix
{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.laptop.enable) {
    programs.alacritty.enable = lib.mkDefault true;
    programs.alacritty.settings = {
      # window.startup_mode = lib.mkDefault "Maximized";
      colors = {
        # Dracula
        # See https://github.com/alacritty/alacritty-theme/blob/master/themes/dracula.toml
        primary = {
          background = lib.mkDefault "#282a36";
          foreground = lib.mkDefault "#f8f8f2";
        };
        normal = {
          black = lib.mkDefault "#000000";
          red = lib.mkDefault "#ff5555";
          green = lib.mkDefault "#50fa7b";
          yellow = lib.mkDefault "#f1fa8c";
          blue = lib.mkDefault "#bd93f9";
          magenta = lib.mkDefault "#ff79c6";
          cyan = lib.mkDefault "#8be9fd";
          white = lib.mkDefault "#bbbbbb";
        };
        bright = {
          black = lib.mkDefault "#555555";
          red = lib.mkDefault "#ff5555";
          green = lib.mkDefault "#50fa7b";
          yellow = lib.mkDefault "#f1fa8c";
          blue = lib.mkDefault "#caa9fa";
          magenta = lib.mkDefault "#ff79c6";
          cyan = lib.mkDefault "#8be9fd";
          white = lib.mkDefault "#ffffff";
        };
      };
    };
  };
}
