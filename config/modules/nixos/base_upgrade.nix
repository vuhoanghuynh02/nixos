# base_upgrade.nix

{ config, inputs, ... }:
{
  system.autoUpgrade.flake = "${inputs.self.outPath}#${config.custom.userName}";
  system.autoUpgrade = {
    enable = true;
    flags = [
      "--update-input"
      "nixpkgs"
      "--update-input"
      "home-manager"
    ];
    dates = "Fri *-*-1..7 19:00:00";
  };
  nix.gc = {
    automatic = true;
    options = "--delete-older-than ${config.custom.cleanAfter}d";
    dates = "Fri *-*-8..14 19:00:00";
  };
  nix.optimise = {
    automatic = true;
    dates = [ "Fri *-*-15..21 19:00:00" ];
  };
}
