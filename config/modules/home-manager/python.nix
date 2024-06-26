# python.nix

{ pkgs, ... }: {
  programs.poetry.enable = true;

  home.packages = with pkgs; [
    micromamba
    (python3.withPackages
      (ps: with ps; [
        # pip

        # jupyter
        # notebook
        # ipykernel

        # numpy
        # pandas
        # matplotlib

        # einops
        # torch
        # flax
      ]))
  ];
}
