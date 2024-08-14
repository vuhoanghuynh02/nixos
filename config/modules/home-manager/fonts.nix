# fonts.nix

{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    roboto
    roboto-mono
    meslo-lgs-nf
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Roboto" ];
      monospace = [ "MesloLGS NF" ];
    };
  };
  programs.vscode.userSettings = {
    "terminal.integrated.fontSize" = 14;
    "terminal.integrated.fontFamily" = "MesloLGS NF";
    "editor.fontSize" = 16;
    "editor.fontFamily" = "Roboto Mono";
  };
}
