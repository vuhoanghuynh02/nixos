# configuration.nix

{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./nixos_home-manager_shared.nix
    ../../modules/nixos/server_shared.nix
  ];
  users.users."${config.custom.userName}".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF4QzECA4NjxAi9RFqfhwBYWj1JRBAqRmC6YOesLRmQQ vincent"
  ];
}
