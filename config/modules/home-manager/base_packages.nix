# base_packages.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./git.nix
  ];

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    trash-cli
    neofetch
  ];
}
