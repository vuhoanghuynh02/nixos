# vietnamese.nix

{ config, lib, pkgs, ... }:
{
  # i18n.inputMethod = {
  #   enabled = "ibus";
  #   ibus.engines = with pkgs; [ ibus-engines.bamboo ];
  # };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-bamboo ];
    fcitx5.waylandFrontend = true;
  };
}


