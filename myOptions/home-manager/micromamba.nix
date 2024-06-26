# micromamba.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.myOptions.micromamba.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf (config.myOptions.micromamba.enable) {
    home.packages = with pkgs; [
      micromamba
    ];
    home.shellAliases."conda" = "micromamba";
    programs.fish.interactiveShellInit = ''
      # >>> mamba initialize >>>
      # !! Contents within this block are managed by 'mamba init' !!
      set -gx MAMBA_EXE "${pkgs.micromamba}/bin/micromamba"
      set -gx MAMBA_ROOT_PREFIX "${config.myOptions.homeDirectory}/micromamba"
      $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
      # <<< mamba initialize <<<
    '';
    programs.bash.bashrcExtra = ''
      # >>> mamba initialize >>>
      # !! Contents within this block are managed by 'mamba init' !!
      export MAMBA_EXE='${pkgs.micromamba}/bin/micromamba';
      export MAMBA_ROOT_PREFIX='${config.myOptions.homeDirectory}/micromamba';
      __mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__mamba_setup"
      else
          alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
      fi
      unset __mamba_setup
      # <<< mamba initialize <<<
    '';
  };
}
