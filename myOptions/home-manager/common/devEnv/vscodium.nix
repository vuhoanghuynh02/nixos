# vscodium.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config.programs.vscode = {
    package = mkDefault pkgs.vscodium;
    profiles.default = {
      enableUpdateCheck = mkDefault false;
      enableExtensionUpdateCheck = mkDefault false;
      extensions = with pkgs.vscode-extensions; [
        mkhl.direnv
      ];
      userSettings = {
        "editor.formatOnSave" = true;
        "editor.fontSize" = 16;
        "terminal.integrated.fontSize" = 16;
        "editor.tabSize" = 2;
        "editor.wordWrap" = "on";
        "terminal.integrated.fontFamily" = cfg.fonts.nerd;
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
  };
}
