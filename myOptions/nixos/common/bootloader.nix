# bootloader.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config.boot.loader = {
    efi.canTouchEfiVariables = mkDefault true;
    grub = {
      enable = mkDefault true;
      # default = mkDefault "saved";
      efiSupport = mkDefault true;
      device = mkDefault "nodev";
    };
  };
}
