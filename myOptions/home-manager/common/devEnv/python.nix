# python.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  options.myOptions.devEnv.python.enable = mkOption {
    type = types.bool;
    default = cfg.devEnv.enable;
  };

  config = mkIf (cfg.devEnv.python.enable) {
    home.packages = with pkgs; [
      (python3.withPackages (py-pkgs:
        with py-pkgs; [
          ipykernel
        ]))
    ];

    programs.ruff = {
      enable = true;
      settings = {
        exclude = config.programs.git.ignores;
        indent-width = 2;
      };
    };
  };
}
