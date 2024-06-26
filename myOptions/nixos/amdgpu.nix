# amdgpu.nix
{
  lib,
  pkgs,
  ...
}: {
  config.hardware.amdgpu = {
    opencl.enable = lib.mkDefault pkgs.config.rocmSupport;
    amdvlk.enable = lib.mkDefault pkgs.config.rocmSupport;
    amdvlk.supportExperimental.enable = lib.mkDefault pkgs.config.rocmSupport;
  };
}
