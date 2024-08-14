# vscodium.nix

{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    nixpkgs-fmt # for jnoortheen.nix-ide
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      pkief.material-icon-theme

      esbenp.prettier-vscode
      valentjn.vscode-ltex
      jnoortheen.nix-ide
      tabnine.tabnine-vscode
    ];

    userSettings = {
      "security.workspace.trust.untrustedFiles" = "newWindow";

      "workbench.colorTheme" = "Dracula Theme";
      "workbench.iconTheme" = "material-icon-theme";

      "terminal.integrated.enableMultiLinePasteWarning" = "never";

      "editor.stickyScroll.enabled" = true;
      "editor.lineNumbers" = "on";
      "editor.unicodeHighlight.nonBasicASCII" = false;
      "editor.acceptSuggestionOnEnter" = "off";
      "editor.suggestSelection" = "first";
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;

      "editor.tabSize" = 2;
      "prettier.tabWidth" = 2;

      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.formatOnSave" = true;
      };

      "git.autofetch" = false;
      "git.openRepositoryInParentFolders" = "always";

      "update.mode" = "none";

      "tabnine.experimentalAutoImports" = true;
    };
  };
}
