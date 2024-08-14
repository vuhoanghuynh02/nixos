# activitywatch.nix

{ config, lib, pkgs, ... }:
{
  services.activitywatch = {
    enable = true;
  };
}
