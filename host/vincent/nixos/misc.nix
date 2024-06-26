# misc.nix
{inputs, ...}: {
  imports = [
    inputs.nixos-cosmic.nixosModules.default
    inputs.nix-snapd.nixosModules.default
  ];

  services.snap.enable = true; # for pomatez
  services.flatpak.enable = true; # for zen-browser and bottles
  myOptions.killers.youtube.disable = false;
}
