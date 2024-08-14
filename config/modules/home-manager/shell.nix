# shell.nix

{ config, lib, pkgs, ... }:
{
  programs = {
    bash.enable = true;
    fish.enable = true;
    oh-my-posh.enable = true;

    eza.enable = true;
    bat.enable = true;
    micro.enable = true;
  };

  home.shellAliases = {
    "neofetch" = "neofetch && date";
    "clear" = "clear && neofetch";
  };
  programs.oh-my-posh.useTheme = "atomic";

  programs.fish.interactiveShellInit = ''
    bind [3\;5~ kill-word
    bind \cH backward-kill-word
    set fish_greeting

    ${config.custom.fishMainConfig}
    
    echo ---
    neofetch
  '';
}
