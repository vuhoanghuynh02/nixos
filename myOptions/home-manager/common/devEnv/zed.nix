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
  config = mkIf (cfg.devEnv.enable) {
    programs.helix.enable = mkDefault true;

    services.ollama.enable =
      mkIf (config.programs.zed-editor.enable)
      (mkDefault true);

    home.packages = with pkgs; [
      glibc # https://zed.dev/docs/linux
    ];
    programs.zed-editor = {
      enable = mkDefault true;
      extensions = [
        "gitfirefly"
      ];
      userSettings = {
        load_direnv = mkDefault "shell_hook";
        vim_mode = mkDefault true;
        "${cfg.compatibility.agent}" = {
          default_model = {
            provider = "ollama";
            model = "qwen2.5-coder:14b";
          };
          version = "2";
        };
      };
    };
  };
}
