# packages.nix
{
  lib,
  pkgs,
  ...
}: {
  config = {
    programs.home-manager.enable = lib.mkDefault true;
    home.packages = with pkgs; [
      trash-cli
    ];
  };
}
