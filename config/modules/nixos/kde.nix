# kde.nix

{ pkgs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    plasma-browser-integration
    oxygen
    spectacle
    kate
    # konsole
  ];

  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
}
