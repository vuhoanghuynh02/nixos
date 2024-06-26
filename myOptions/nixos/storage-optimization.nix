# storage-optimization.nix
{lib, ...}: {
  config = {
    boot.tmp.useTmpfs = lib.mkForce true;
    swapDevices = lib.mkForce [];
    zramSwap.writebackDevice = lib.mkForce null;

    zramSwap.enable = lib.mkDefault true;
    zramSwap.memoryPercent = lib.mkDefault 400;
  };
}
