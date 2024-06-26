# zed.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  home.packages = with pkgs; [
    nil
    alejandra
  ];

  programs.zed-editor = {
    enable = mkDefault true;
    extensions = [
      "xy-zed"
      "nix"
    ];
    userSettings = {
      theme.light = mkDefault "XY-Zed";
      theme.dark = mkDefault "XY-Zed";
      ui_font_size = mkDefault 15;
      buffer_font_size = mkDefault 15;
      buffer_font_family = mkDefault cfg.fonts.nerd;
      ui_font_family = mkDefault cfg.fonts.sans;
      soft_wrap = mkDefault "editor_width";

      languages.Nix.language_servers = ["nil" "!nixd"];
      lsp.nil = {
        initialization_options.formatting.command = ["alejandra" "--quiet" "--"];
        settings.diagnostics.ignored = ["unused_binding" "unused_with"];
      };
      features."${cfg.compatibility.edit_prediction_provider}" = "supermaven";
    };
  };
}
