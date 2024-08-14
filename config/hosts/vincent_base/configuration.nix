# configuration.nix

{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./nixos_home-manager_shared.nix
    ../../modules/nixos/desktop_shared.nix
    ../../modules/nixos/obs-virt-cam.nix
  ];

  # specialisation.server = {
  #   inheritParentConfig = false;
  #   configuration.system.autoUpgrade.flake = lib.mkForce "${inputs.self.outPath}#${config.custom.configHostName}";
  #   configuration.imports = [ ../server/configuration.nix ];
  # };

  # specialisation.sophie = {
  #   inheritParentConfig = false;
  #   configuration.system.autoUpgrade.flake = lib.mkForce "${inputs.self.outPath}#${config.custom.configHostName}";
  #   configuration.imports = [ ../sophie/configuration.nix ];
  # };
}
