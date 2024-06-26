# packages.nix
{
  config,
  pkgs,
  ...
}: {
  myOptions.devEnv.enable = true;
  programs.mpv.enable = config.myOptions.sound.enable;

  home.packages = with pkgs; [
    tldr

    nextcloud-client
    anki
    onlyoffice-desktopeditors
    bottles # for gomocup
  ];
}
