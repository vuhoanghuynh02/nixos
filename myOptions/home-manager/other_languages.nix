# languages.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.myOptions.devEnv = {
    nix.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.myOptions.laptop.enable;
    };
    bash.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.myOptions.devEnv.enable;
    };
    markdown.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.myOptions.devEnv.enable;
    };
    javascript.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    typescript.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    scala.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  # See https://github.com/lassik/emacs-format-all-the-code
  config.home.packages = with pkgs;
    lib.optionals config.myOptions.devEnv.nix.enable [
      nil
      alejandra
    ]
    ++ lib.optionals config.myOptions.devEnv.scala.enable [
      scalafmt
    ]
    ++ lib.optionals (config.myOptions.devEnv.markdown.enable
      || config.myOptions.devEnv.javascript.enable
      || config.myOptions.devEnv.typescript.enable) [
      deno
    ]
    ++ lib.optionals config.myOptions.devEnv.bash.enable [
      shfmt
    ];
}
