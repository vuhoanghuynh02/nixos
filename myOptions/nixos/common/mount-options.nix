# mount-options.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config.fileSystems = {
    "/".options = [
      "compress=zstd"
      "lazytime"
    ];
    "/home".options = [
      "compress=zstd"
      "lazytime"
    ];
    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
    "/boot".options = ["noatime"];
  };
}
