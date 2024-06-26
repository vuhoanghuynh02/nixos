# alacritty.nix
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
    programs.alacritty.enable = mkDefault true;
    programs.alacritty.settings = {
      # window.startup_mode = mkDefault "Maximized";
      colors = {
        # Dracula
        # See https://github.com/alacritty/alacritty-theme/blob/master/themes/dracula.toml
        primary = {
          background = mkDefault "#282a36";
          foreground = mkDefault "#f8f8f2";
        };
        normal = {
          black = mkDefault "#000000";
          red = mkDefault "#ff5555";
          green = mkDefault "#50fa7b";
          yellow = mkDefault "#f1fa8c";
          blue = mkDefault "#bd93f9";
          magenta = mkDefault "#ff79c6";
          cyan = mkDefault "#8be9fd";
          white = mkDefault "#bbbbbb";
        };
        bright = {
          black = mkDefault "#555555";
          red = mkDefault "#ff5555";
          green = mkDefault "#50fa7b";
          yellow = mkDefault "#f1fa8c";
          blue = mkDefault "#caa9fa";
          magenta = mkDefault "#ff79c6";
          cyan = mkDefault "#8be9fd";
          white = mkDefault "#ffffff";
        };
      };
    };
  };
}
