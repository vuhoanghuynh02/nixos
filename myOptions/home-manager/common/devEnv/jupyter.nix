# jupyter.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = mkIf (cfg.devEnv.enable) {
    programs.vscode = {
      enable = mkDefault true;
      profiles.default = {
        extensions = with pkgs.vscode-extensions.ms-toolsai; [
          jupyter
          vscode-jupyter-cell-tags
          jupyter-keymap
          jupyter-renderers
          vscode-jupyter-slideshow
        ];
      };
    };
  };
}
