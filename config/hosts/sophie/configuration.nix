# configuration.nix

{ ... }:
{
  imports = [
    ./options.nix
    ../../modules/nixos/desktop_shared.nix
    ../../modules/nixos/kde.nix
  ];
  boot.loader.grub.useOSProber = true;
}

