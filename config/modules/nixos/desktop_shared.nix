# desktop_shared.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./base_shared.nix
    ./desktop_packages.nix
    ./sound.nix
    ./kde.nix
  ];

  system.autoUpgrade.operation = "boot";
  hardware.bluetooth.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.portal.enable = true;

  ######## Options I don't understand enough ########

  xdg.portal.wlr.enable = true;
}
