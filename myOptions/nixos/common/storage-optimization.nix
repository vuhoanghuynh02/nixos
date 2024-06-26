# storage-optimization.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = {
    boot.tmp.useTmpfs = mkForce true;
    swapDevices = mkForce [];
    zramSwap.writebackDevice = mkForce null;

    zramSwap.enable = mkDefault true;
    zramSwap.memoryPercent = mkDefault 400;
  };
}
