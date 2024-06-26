# vscodium.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  config.programs.vscode = lib.mkIf (config.myOptions.laptop.enable) {
    enable = lib.mkDefault true;
    package = lib.mkDefault pkgs.vscodium;
    # profiles.default = {
    enableUpdateCheck = lib.mkDefault false;
    enableExtensionUpdateCheck = lib.mkDefault false;
    extensions = with pkgs.vscode-extensions; [
      denoland.vscode-deno
      mkhl.direnv
      jnoortheen.nix-ide
      formulahendry.code-runner
      dbaeumer.vscode-eslint
      ms-toolsai.jupyter
      ms-toolsai.vscode-jupyter-cell-tags
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers
      ms-toolsai.vscode-jupyter-slideshow
      davidanson.vscode-markdownlint
      ms-python.python
      mechatroner.rainbow-csv
      charliermarsh.ruff
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      # gera2ld.markmap-vscode
      # tabnine.tabnine-vscode
      # ms-python.vscode-pylance
    ];

    userSettings = {
      "[markdown]"."editor.defaultFormatter" = "denoland.vscode-deno";
      "editor.fontSize" = 15;
      "terminal.integrated.fontSize" = 13;
      "editor.formatOnSave" = true;
      # "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "tabnine.experimentalAutoImports" = true;
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
      "editor.acceptSuggestionOnCommitCharacter" = false;
      "editor.acceptSuggestionOnEnter" = "off";
      "update.showReleaseNotes" = false;
      "update.mode" = "none";
      "extensions.autoUpdate" = "onlyEnabledExtensions";
      "extensions.autoCheckUpdates" = false;
      "[latex]" = {
        "editor.defaultFormatter" = "James-Yu.latex-workshop";
      };
      "terminal.integrated.commandsToSkipShell" = [
        "language-julia.interrupt"
      ];
      "julia.symbolCacheDownload" = true;
      "julia.enableTelemetry" = true;
      "[julia]" = {
        "editor.defaultFormatter" = "julialang.language-julia";
      };
      "terminal.integrated.inheritEnv" = false;
      "terminal.integrated.defaultProfile.linux" = "fish";
      "[python]" = {
        "editor.defaultFormatter" = "charliermarsh.ruff";
      };
      "editor.tabSize" = 2;
      "[rust]" = {
        "editor.defaultFormatter" = "rust-lang.rust-analyzer";
      };
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "diagnostics" = {
            "ignored" = [
              # "unused_binding",
              # "unused_with"
            ];
          };
          "formatting" = {
            # "command" = ["nixfmt"];
            "command" = [
              "alejandra"
            ];
          };
        };
      };
      "terminal.integrated.fontFamily" = "MesloLGS NF";
      "diffEditor.renderSideBySide" = true;
      "diffEditor.ignoreTrimWhitespace" = true;
      "deno.enable" = true;
      "deno.path" = "/home/vincent/.nix-profile/bin/deno";
      "editor.wordWrap" = "on";
      "[jsonc]" = {
        "editor.defaultFormatter" = "denoland.vscode-deno";
      };
    };
  };
  # };
}
