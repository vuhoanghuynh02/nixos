# typescript.nix

{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    nodePackages.pnpm
    nodePackages.ts-node
    nodejs-slim
  ];
}
