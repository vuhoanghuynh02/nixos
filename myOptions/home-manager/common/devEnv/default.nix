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
    # ./defauft.nix
    ./git.nix
    ./jupyter.nix
    ./misc.nix
    ./python.nix
    ./rust.nix
    ./vscodium.nix
    ./zed.nix
  ];
}
