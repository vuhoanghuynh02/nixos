# no-temp-on-drive.nix

{ config, lib, pkgs, ... }:
{
  boot.tmp.useTmpfs = true;
  swapDevices = lib.mkForce [ ];
  zramSwap.writebackDevice = lib.mkForce null;

  zramSwap.enable = true;
  zramSwap.memoryPercent = 400;
}
