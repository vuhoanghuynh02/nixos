# cpp.nix

{ config, lib, pkgs, ... }:
{
  programs.vscode.userSettings = {
    "[cpp]" = {
      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
    };
    "cmake.configureOnOpen" = false;
    "cmake.configureOnEdit" = false;
    # "cmake.buildDirectory" = "\${workspaceFolder}/temp_build_debug";
    "cmake.parallelJobs" = 3;
    "cmake.showOptionsMovedNotification" = false;
  };
}
