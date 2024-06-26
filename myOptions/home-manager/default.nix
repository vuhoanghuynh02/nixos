# default.nix
{...}: {
  imports = [
    ../../home.nix
    ../common
    ./devEnv
    ./alacritty.nix
    ./autoClean.nix
    ./autostart.nix
    # default.nix
    ./flameshot.nix
    ./laptop.nix
    ./misc.nix
    ./packages.nix
    ./redroid.nix
    ./sound.nix
    ./terminal.nix
    ./xdg.nix
  ];
}
