# emacs.nix

{ config, lib, pkgs, ... }:
{
  programs.emacs =
    {
      enable = true;
    };
}
