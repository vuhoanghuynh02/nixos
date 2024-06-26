# redroid.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.myOptions.redroid.enable) {
    virtualisation.podman.enable = true;
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}
