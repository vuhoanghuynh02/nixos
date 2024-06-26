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
  myOptions.devEnv.enable = true;
  myOptions.pomatez_appimage = "${cfg.homeDirectory}/portable/Pomatez-v1.7.2-linux-x86_64.AppImage";

  home.packages = with pkgs; [
    tldr

    nextcloud-client
    anki
    kdePackages.kalarm
  ];
}
