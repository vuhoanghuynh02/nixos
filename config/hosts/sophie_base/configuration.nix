# configuration.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./nixos_home-manager_shared.nix
    ../../modules/nixos/desktop_shared.nix
  ];
  boot.loader.grub.useOSProber = true;

  # Temporarily
  networking.enableIPv6 = false;
  services.tlp.settings.USB_EXCLUDE_BTUSB = 1;
}

