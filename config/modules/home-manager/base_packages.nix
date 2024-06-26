# base_packages.nix

{ pkgs, ... }:
{
  programs = {
    home-manager.enable = true;
    bash.enable = true;
    fish.enable = true;

    eza.enable = true;
    bat.enable = true;
    lf.enable = true;
    micro.enable = true;
    btop.enable = true;
    gitui.enable = true;
  };

  home.packages = with pkgs; [
    tldr
    trash-cli
    neofetch
  ];
}
