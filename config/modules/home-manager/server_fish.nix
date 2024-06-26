# server_fish.nix

{ ... }:
{
  programs.fish = {
    interactiveShellInit = ''
      bind [3\;5~ kill-word
      bind \cH backward-kill-word
      set fish_greeting
      neofetch
    '';
  };
}
