# vscodium.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  config.programs.vscode = lib.mkIf (config.myOptions.devEnv.enable) {
    enable = lib.mkDefault true;
    package = lib.mkDefault pkgs.vscodium;
    # profiles.default = {
    enableUpdateCheck = lib.mkDefault false;
    enableExtensionUpdateCheck = lib.mkDefault false;
    extensions = with pkgs.vscode-extensions; [
      denoland.vscode-deno
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
      "[jsonc]"."editor.defaultFormatter" = "denoland.vscode-deno";
      "deno.enable" = true;
      "deno.path" = "/home/vincent/.nix-profile/bin/deno";

      "[python]"."editor.defaultFormatter" = "charliermarsh.ruff";
      "[rust]"."editor.defaultFormatter" = "rust-lang.rust-analyzer";
      "editor.formatOnSave" = true;

      "editor.fontSize" = 15;
      "terminal.integrated.fontSize" = 13;
      "editor.tabSize" = 2;
      "terminal.integrated.fontFamily" = "MesloLGS NF";
      "editor.wordWrap" = "on";
      "editor.acceptSuggestionOnEnter" = "off";
      "diffEditor.ignoreTrimWhitespace" = true;
      "diffEditor.renderSideBySide" = false;

      "update.showReleaseNotes" = false;
      "update.mode" = "none";
      "extensions.autoUpdate" = "onlyEnabledExtensions";
      "extensions.autoCheckUpdates" = false;

      "editor.acceptSuggestionOnCommitCharacter" = false;
      "terminal.integrated.inheritEnv" = false;
      "terminal.integrated.defaultProfile.linux" = "fish";
      "git.openRepositoryInParentFolders" = "always";
    };
  };
  # };
}
