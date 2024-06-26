# home.nix

{ pkgs, ... }: {
  imports = [
    ./options.nix
    ../../modules/home-manager/desktop_shared.nix
    ../../modules/home-manager/python.nix
    ./vscodium.nix
    ./fish.nix
    ./admin.nix
  ];

  programs = {
    ssh.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
  services.activitywatch.enable = true;

  home.packages = with pkgs; [
    # cli
    appimage-run
    julia

    # gui
    okular
    vlc
    kdePackages.kclock

    brave
    nextcloud-client
    kdePackages.kmenuedit

    kdePackages.kalarm
    appflowy
    anki
  ];

  programs.git = {
    userName = "Vu Hoang Huynh";
    userEmail = "vuhoanghuynh02@outlook.com";
  };
}
