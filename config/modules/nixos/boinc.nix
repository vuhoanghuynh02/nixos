# boinc.nix

{ config, lib, pkgs, ... }:
{
  services.boinc.enable = true;
  users.users.${config.custom.userName}.extraGroups = [ "boinc" ];

  # See https://search.nixos.org/options?channel=unstable&show=services.boinc.extraEnvPackages
  services.boinc.extraEnvPackages = with pkgs; [
    virtualbox
    ocl-icd
  ];
}
