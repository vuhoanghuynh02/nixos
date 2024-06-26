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
  config = lib.mkIf (cfg.devEnv.enable) {
    programs.helix.enable = mkDefault true;
    programs.helix.defaultEditor = mkDefault true;

    # services.ollama.enable =
    #   mkIf (config.programs.zed-editor.enable)
    #   (mkDefault true); # 25.05
    #
    home.packages = with pkgs; [
      glibc # https://zed.dev/docs/linux
    ];
    programs.zed-editor = {
      enable = mkDefault true;
      extensions = ["xy-zed"];
      userSettings = {
        theme.light = mkDefault "XY-Zed";
        theme.dark = mkDefault "XY-Zed";
        ui_font_size = mkDefault 16;
        buffer_font_size = mkDefault 16;
        buffer_font_family = mkDefault cfg.fonts.nerd;
        ui_font_family = mkDefault cfg.fonts.sans;
        vim_mode = mkDefault true;
        features.inline_completion_provider = "supermaven";
        assistant = {
          default_model = {
            provider = "ollama";
            model = "qwen2.5-coder:7b";
          };
          version = "2";
        };
      };
    };
  };
}
