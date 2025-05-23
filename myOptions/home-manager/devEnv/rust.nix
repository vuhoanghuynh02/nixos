# rust.nix
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options.myOptions.devEnv.rust.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.myOptions.devEnv.enable;
  };

  config = lib.mkIf (config.myOptions.devEnv.rust.enable) {
    nixpkgs.overlays = [inputs.fenix.overlays.default];
    home.packages = with pkgs; [
      (fenix.combine (with fenix; [
        stable.rustfmt
        stable.cargo
        stable.rust-src
        latest.rustc
        latest.rustc-codegen-cranelift
      ]))
      evcxr
      cargo-nextest
    ];

    programs.zed-editor.extensions = ["toml"];

    xdg.configFile.".cargo".source = ../../../.config/.cargo;
    xdg.configFile."evcxr".source = ../../../.config/evcxr;
  };
}
