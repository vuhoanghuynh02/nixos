# home.nix

{ ... }:
{
  imports = [
    ./options.nix
    ./packages.nix
    ../../modules/home-manager/desktop_shared.nix
    ../../modules/home-manager/server_fish.nix
  ];
}
