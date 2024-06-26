# packages.nix
{pkgs, ...}: {
  myOptions.devEnv.enable = true;

  home.packages = with pkgs; [
    tldr

    nextcloud-client
    anki

    appimage-run # for pomatez
  ];

  home.shellAliases."pomatez" = "appimage-run  ~/portable/Pomatez-v1.7.2-linux-x86_64.AppImage";
}
