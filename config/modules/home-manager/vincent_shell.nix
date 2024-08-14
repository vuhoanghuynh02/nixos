# vincent_shell.nix

{ config, lib, pkgs, ... }:
{
  home.shellAliases = {
    "debian" = "distrobox enter debian --";
  };
  custom.fishMainConfig = ''
    # set -gx MAMBA_EXE ${config.custom.homeDirectory}/.nix-profile/bin/micromamba
    # set -gx MAMBA_ROOT_PREFIX ${config.custom.homeDirectory}/micromamba
    # $MAMBA_EXE shell hook --shell fish --prefix $MAMBA_ROOT_PREFIX | source
  '';
}
