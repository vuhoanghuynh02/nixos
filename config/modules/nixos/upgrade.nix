# upgrade.nix

{ config, lib, pkgs, inputs, ... }:
{
  system.autoUpgrade.flake = "${inputs.self.outPath}#${config.custom.configHostName}";
  system.autoUpgrade = {
    enable = true;
    flags = [
      "--update-input"
      "nixpkgs"
      "--update-input"
      "home-manager"
    ];
    dates = "Mon *-*-1..7";
  };
  nix.gc = {
    automatic = true;
    options = config.home-manager.users.${config.custom.userName}.nix.gc.options;
    dates = config.home-manager.users.${config.custom.userName}.nix.gc.frequency;
  };
  nix.optimise = {
    automatic = true;
    dates = [ "Mon *-*-15..21" ];
  };
}
