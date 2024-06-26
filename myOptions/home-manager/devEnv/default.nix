# default.nix
{...}: {
  imports = [
    # ./defauft.nix
    ./git.nix
    ./micromamba.nix
    ./misc.nix
    ./nix.nix
    ./other_languages.nix
    ./python.nix
    ./rust.nix
    ./vscodium.nix
    ./zed.nix
  ];
}
