# python.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.myOptions.devEnv.python.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.myOptions.devEnv.enable;
  };

  config = lib.mkIf (config.myOptions.devEnv.python.enable) {
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
