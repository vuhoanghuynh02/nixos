# default.nix
{...}: {
  imports = [
    ../../home.nix
    ../common
    ./alacritty.nix
    ./autoClean.nix
    ./autostart.nix
    ./brave.nix
    ./cosmic.nix
    # default.nix
    ./devEnv.nix
    ./firefox.nix
    ./flameshot.nix
    ./fonts.nix
    ./git.nix
    ./micromamba.nix
    ./misc.nix
    ./other_languages.nix
    ./packages.nix
    ./python.nix
    ./redroid.nix
    ./rust.nix
    ./terminal.nix
    ./vscodium.nix
    ./xdg.nix
  ];
}
