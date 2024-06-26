# rust.nix
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  options.myOptions.devEnv.rust.enable = mkOption {
    type = types.bool;
    default = cfg.devEnv.enable;
  };

  config = mkIf (cfg.devEnv.rust.enable) {
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

    xdg.configFile.".cargo".source = ./.config/.cargo;
    xdg.configFile."evcxr".source = ./.config/evcxr;
  };
}
