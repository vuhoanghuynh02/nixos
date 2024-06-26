# fish.nix

{ config, ... }:
{
  programs.fish = {
    interactiveShellInit = ''
      bind [3\;5~ kill-word
      bind \cH backward-kill-word
      
      set fish_greeting

      set -gx MAMBA_EXE ${config.home.homeDirectory}/.nix-profile/bin/micromamba
      set -gx MAMBA_ROOT_PREFIX ${config.home.homeDirectory}/micromamba
      $MAMBA_EXE shell hook --shell fish --prefix $MAMBA_ROOT_PREFIX | source
      
      echo ---
      neofetch
    '';
  };
}
