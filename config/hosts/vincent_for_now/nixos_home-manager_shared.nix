# nixos_home-manager_shared.nix

{ config, lib, pkgs, ... }:
{
  custom.configHostName = "vincent_for_now";

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
    "code"
    "vscode"
    # "vscode-extension-ms-vscode-remote-remote-containers"
    # "vscode-extension-ms-vscode-remote-remote-ssh"
  ];
}
