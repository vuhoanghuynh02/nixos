# mount-options.nix
{...}: {
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
