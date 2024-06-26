# cosmic.nix
{
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  config.services = lib.mkIf (config.myOptions.laptop.enable) {
    desktopManager.cosmic.enable = lib.mkDefault true;
    displayManager.cosmic-greeter.enable = lib.mkDefault config.services.desktopManager.cosmic.enable;
  };
}
