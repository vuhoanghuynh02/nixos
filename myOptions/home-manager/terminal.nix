# terminal.nix
{lib, ...}: {
  config = {
    programs = {
      bash.enable = lib.mkDefault true;
      fish.enable = lib.mkDefault true;
      oh-my-posh = {
        enable = lib.mkDefault true;
        useTheme = lib.mkDefault "atomic";
      };
      eza.enable = lib.mkDefault true;
      bat.enable = lib.mkDefault true;
      tmux.enable = lib.mkDefault true;
    };

    home.shellAliases = {
      "cat" = lib.mkDefault "bat --style plain";
      "clear" = lib.mkDefault "clear && date";
      "woman" = lib.mkDefault "man";
      "ls" = lib.mkDefault "eza -a --group-directories-first";
      "ll" = lib.mkDefault "eza -al --group-directories-first";
      "lt" = lib.mkDefault "eza -aT --group-directories-first";
    };

    programs.fish.interactiveShellInit = ''
      bind [3\;5~ kill-word
      bind \cH backward-kill-word
      set fish_greeting
    '';
    programs.fish.shellInitLast = lib.mkDefault ''
      date
    '';
  };
}
