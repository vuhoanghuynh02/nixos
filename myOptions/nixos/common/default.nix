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
    ./amdgpu.nix
    ./autoClean.nix
    ./bootloader.nix
    ./cosmic.nix
    # default.nix
    ./dnscrypt.nix
    ./ipfs.nix
    ./keyboard.nix
    ./killers.nix
    ./localsend.nix
    ./misc.nix
    ./misc2.nix
    ./mount-options.nix
    ./network.nix
    ./nix.nix
    ./nvidia.nix
    ./podman.nix
    ./power-save.nix
    ./sound.nix
    ./storage-optimization.nix
    ./virt-manager.nix
  ];
}
