# amdgpu.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config.hardware.amdgpu = {
    opencl.enable = mkDefault pkgs.config.rocmSupport;
    amdvlk.enable = mkDefault pkgs.config.rocmSupport;
    amdvlk.supportExperimental.enable = mkDefault pkgs.config.rocmSupport;
  };
}
