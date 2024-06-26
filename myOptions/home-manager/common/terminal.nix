# terminal.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = {
    programs = {
      bash.enable = mkDefault true;
      fish.enable = mkDefault true;
      oh-my-posh = {
        enable = mkDefault true;
        useTheme = mkDefault "atomic";
      };
      eza.enable = mkDefault true;
      bat.enable = mkDefault true;
      tmux.enable = mkDefault true;
    };

    home.shellAliases = {
      "cat" = mkDefault "bat --style plain";
      "clear" = mkDefault "clear && date";
      "woman" = mkDefault "man";
      "ls" = mkDefault "eza -a --group-directories-first";
      "ll" = mkDefault "eza -al --group-directories-first";
      "lt" = mkDefault "eza -aT --group-directories-first";
    };

    programs.fish.interactiveShellInit = ''
      bind [3\;5~ kill-word
      bind \cH backward-kill-word
      set fish_greeting
    '';
    programs.fish.shellInitLast = mkDefault ''
      date
    '';
  };
}
