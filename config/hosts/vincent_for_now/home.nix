# home.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./nixos_home-manager_shared.nix
    ../vincent_base/home.nix
    ../../modules/home-manager/python.nix
    ../../modules/home-manager/cpp.nix
  ];

  home.packages = with pkgs; [
    nodePackages.pnpm
    nodejs-slim
    nodePackages.ts-node
    distrobox
    spotify
  ];

  programs.vscode = {
    package = lib.mkForce pkgs.vscode; # unfree
    mutableExtensionsDir = lib.mkForce true;
    extensions = with pkgs.vscode-extensions; [
      # ms-vscode-remote.remote-ssh # unfree
      # ms-vscode-remote.remote-containers # unfree
      # eamodio.gitlens
      # donjayamanne.githistory
      # formulahendry.code-runner
      # ms-azuretools.vscode-docker
    ];
  };
}
