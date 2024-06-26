# fonts.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  options.myOptions.fonts = {
    nerd = mkOption {
      type = types.str;
      default = "BlexMono Nerd Font";
    };
    sans = mkOption {
      type = types.str;
      default = "Open Sans";
    };
  };

  config = {
    myOptions.packages = with pkgs; [
      nerd-fonts.blex-mono
    ];
    fonts.fontconfig = {
      enable = mkDefault true;
      defaultFonts = {
        sansSerif = [cfg.fonts.sans];
        monospace = [cfg.fonts.nerd];
      };
    };
  };
}
