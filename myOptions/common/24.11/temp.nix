# temp.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  nixpkgs.overlays = [
    (final: prev: {
      nerd-fonts.blex-mono = prev.nerdfonts.override {fonts = ["IBMPlexMono"];};
    })
  ];
}
