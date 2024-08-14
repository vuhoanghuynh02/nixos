# kde.nix

{ config, lib, pkgs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Search optionalPackages in https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/services/desktop-managers/plasma6.nix
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    # konsole
    # (lib.getBin qttools) # Expose qdbus in PATH
    # ark
    elisa
    # gwenview
    # okular
    kate
    # khelpcenter
    # dolphin
    # dolphin-plugins
    spectacle
    # ffmpegthumbs
    # 24.11 # krdp
    print-manager # 24.11 #
  ];

  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
}
