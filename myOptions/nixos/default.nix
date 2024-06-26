# default.nix
{...}: {
  imports = [
    ../../configuration.nix
    ../../hardware-configuration.nix
    ../common
    ./amdgpu.nix
    ./autoClean.nix
    ./bootloader.nix
    ./cosmic.nix
    # default.nix
    ./dnscrypt.nix
    ./killers.nix
    ./localsend.nix
    ./misc.nix
    ./mount-options.nix
    ./network.nix
    ./nix.nix
    ./no-temp-on-drive.nix
    ./nvidia.nix
    ./podman.nix
    ./power-save.nix
    ./redroid.nix
    ./sound.nix
    ./syncthing.nix
    ./vnIme.nix
  ];
}
