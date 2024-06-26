# bootloader.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  config.boot.loader = {
    efi.canTouchEfiVariables = lib.mkDefault true;
    grub = {
      enable = lib.mkDefault true;
      # default = lib.mkDefault "saved";
      efiSupport = lib.mkDefault true;
      device = lib.mkDefault "nodev";
    };
  };
}
