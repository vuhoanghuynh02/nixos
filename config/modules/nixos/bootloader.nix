# bootloader.nix

{ config, lib, pkgs, ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      default = "saved";
      efiSupport = true;
      device = "nodev";
    };
  };
}
