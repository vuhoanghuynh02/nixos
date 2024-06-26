# comma.nix
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  imports = [inputs.nix-index-database.hmModules.nix-index];
  programs.nix-index-database.comma.enable = mkDefault true;
}
