# nix.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.myOptions.devEnv.nix.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.myOptions.devEnv.enable;
  };

  config = lib.mkIf (config.myOptions.devEnv.nix.enable) {
    home.packages = with pkgs; [
      nil
      alejandra
    ];

    programs.zed-editor = {
      extensions = ["nix"];
      userSettings = {
        languages.Nix.language_servers = ["nil" "!nixd"];
        lsp.nil = {
          initialization_options.formatting.command = ["alejandra" "--quiet" "--"];
          settings.diagnostics.ignored = ["unused_binding" "unused_with"];
        };
        load_direnv = lib.mkDefault "shell_hook";
      };
    };

    programs.vscode = {
      extensions = with pkgs.vscode-extensions; [
        mkhl.direnv
        jnoortheen.nix-ide
      ];
      userSettings = {
        "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "nix.serverSettings"."nil" = {
          "formatting"."command" = ["alejandra" "--quiet" "--"];
          "diagnostics"."ignored" = ["unused_binding" "unused_with"];
        };
      };
    };
  };
}
