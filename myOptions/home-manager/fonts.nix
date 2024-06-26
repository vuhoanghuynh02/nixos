# fonts.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      meslo-lgs-nf
    ];
    fonts.fontconfig = {
      enable = lib.mkDefault true;
      defaultFonts = {
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
        monospace = [ "MesloLGS NF" ];
      };
    };
  };
}
