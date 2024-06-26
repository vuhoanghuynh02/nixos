# vscodium.nix

{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    python3Packages.jedi-language-server # for ms-python.python
  ];
  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      eamodio.gitlens
      mkhl.direnv

      julialang.language-julia
      ms-toolsai.jupyter
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers

      ms-python.python
      ms-python.black-formatter
      ms-python.debugpy
    ];

    userSettings = {
      "terminal.integrated.commandsToSkipShell" = [ "language-julia.interrupt" ];

      "[cpp]" = {
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
      };
      "cmake.configureOnOpen" = false;
      "cmake.configureOnEdit" = false;
      "cmake.buildDirectory" = "\${workspaceFolder}/temp_build_debug";
      "cmake.parallelJobs" = 3;
      "cmake.showOptionsMovedNotification" = false;

      "[python]" = {
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "ms-python.black-formatter";
      };
      "python.defaultInterpreterPath" = "python3";
      # "python.defaultInterpreterPath" = "${config.home.homeDirectory}/.nix-profile/bin/python3";
      "notebook.output.textLineLimit" = 555;
      "jupyter.disableJupyterAutoStart" = true;

      "[julia]" = {
        "editor.defaultFormatter" = "julialang.language-julia";
      };
      "julia.enableTelemetry" = true;
      "julia.symbolCacheDownload" = true;
      "julia.enableCrashReporter" = true;
      "julia.editor" = "codium";
      "julia.execution.codeInREPL" = true;
      "julia.execution.inlineResultsForCellEvaluation" = true;
      "julia.execution.saveOnEval" = true;
      "julia.focusPlotNavigator" = true;
      "julia.inlayHints.static.enabled" = true;

      "[latex]" = {
        "editor.defaultFormatter" = "James-Yu.latex-workshop";
        "editor.formatOnSave" = true;
      };

      "direnv.watchForChanges" = false;
      "syncSettings.confirmSync" = true;
    };
  };
}

