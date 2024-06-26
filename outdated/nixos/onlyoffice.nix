# onlyoffice.nix

{ config, lib, pkgs, ... }:
{
  services.onlyoffice = {
    enable = true;
    port = 53340;
  };
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "corefonts"
  ];
}
