# default.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  imports = [
    ./devEnv
    ./alacritty.nix
    ./autoClean.nix
    ./autostart.nix
    ./comma.nix
    ./compatibility.nix
    # default.nix
    ./flameshot.nix
    ./laptop.nix
    ./misc.nix
    ./packages.nix
    ./packages2.nix
    ./pomatez.nix
    ./sound.nix
    ./terminal.nix
    ./xdg.nix
    ./zed.nix
  ];
}
