# packages.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = {
    programs.home-manager.enable = mkDefault true;
    home.packages = with pkgs; [
      trash-cli
    ];
  };
}
