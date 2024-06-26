# fonts.nix

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    roboto
    jetbrains-mono
    roboto-mono
  ];
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Roboto" ];
        monospace = [ "JetBrains Mono" ];
      };
    };
  };
}
