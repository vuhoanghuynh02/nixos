# server_shared.nix

{ config, ... }:
{
  imports = [
    ./base_shared.nix
    ./server_fish.nix
  ];
}
