# desktop_packages.nix

{ pkgs, ... }:
{
  imports = [
    ./localsend.nix
  ];

  environment.systemPackages = with pkgs; [
    # wl-clipboard # for Waydroid
  ];

  # virtualisation.waydroid.enable = true;
  programs.dconf.enable = true;

  ######## Options I don't understand enough ########

  programs.nix-ld.enable = true;
}
