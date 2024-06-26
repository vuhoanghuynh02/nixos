# desktop_vscodium.nix

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixpkgs-fmt # for jnoortheen.nix-ide
  ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      pkief.material-icon-theme

      esbenp.prettier-vscode
      valentjn.vscode-ltex
      jnoortheen.nix-ide
    ];

    userSettings = {
      "security.workspace.trust.untrustedFiles" = "newWindow";

      "workbench.colorTheme" = "Dracula";
      "workbench.iconTheme" = "material-icon-theme";

      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.fontFamily" = "JetBrains Mono";
      "terminal.integrated.enableMultiLinePasteWarning" = "never";

      "editor.fontSize" = 16;
      "editor.fontFamily" = "Roboto Mono";
      "editor.stickyScroll.enabled" = true;
      "editor.lineNumbers" = "on";
      "editor.unicodeHighlight.nonBasicASCII" = false;
      "editor.acceptSuggestionOnEnter" = "off";
      "editor.suggestSelection" = "first";
      "editor.tabSize" = 4;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;

      "prettier.tabWidth" = 4;

      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.formatOnSave" = true;
      };

      "git.autofetch" = false;
      "git.openRepositoryInParentFolders" = "always";

      "update.mode" = "none";
    };
  };
}
