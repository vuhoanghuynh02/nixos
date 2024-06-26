# desktop_shared.nix

{ ... }:
{
  imports = [
    ./base_shared.nix
    ./desktop_packages.nix
  ];

  specialisation = {
    sound.configuration.imports = [ ./sound.nix ];
    vietnamese.configuration.imports = [ ./vietnamese.nix ];
    sound-vietnamese.configuration.imports = [
      ./sound.nix
      ./vietnamese.nix
    ];
  };

  system.autoUpgrade.operation = "boot";
  hardware.bluetooth.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.portal.enable = true;

  ######## Options I don't understand enough ########

  xdg.portal.wlr.enable = true;
}
