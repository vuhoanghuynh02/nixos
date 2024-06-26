# packages2.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = mkIf cfg.hosts.vincent-home.enable {
    myOptions.devEnv.enable = true;
    myOptions.pomatez_appimage = "${cfg.homeDirectory}/portable/Pomatez-v1.7.2-linux-x86_64.AppImage";
    services.nextcloud-client.enable = true;
    home.packages = with pkgs; [
      tldr

      anki
      kdePackages.kalarm

      appflowy
      freetube
    ];
  };
}
