# configuration.nix

{ lib, ... }:
{
  imports = [
    ./options.nix
    ../../modules/nixos/desktop_shared.nix
    ../../modules/nixos/kde.nix
  ];
}
