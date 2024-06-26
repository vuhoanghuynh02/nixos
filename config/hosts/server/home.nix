# home.nix

{ ... }:
{
  imports = [
    ./options.nix
    ../../modules/home-manager/server_shared.nix
  ];
}
