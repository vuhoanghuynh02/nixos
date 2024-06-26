# nix.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      max-jobs = lib.mkDefault "auto";
    };
    package = lib.mkDefault pkgs.nix;
  };
}
