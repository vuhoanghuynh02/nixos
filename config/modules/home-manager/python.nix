# python.nix

{ config, lib, pkgs, ... }:
{
  programs.vscode.userSettings = {
    "[python]" = {
      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "ms-python.black-formatter";
    };
    "python.defaultInterpreterPath" = "python3";

    "notebook.output.textLineLimit" = 555;
    "jupyter.disableJupyterAutoStart" = true;
  };
}
