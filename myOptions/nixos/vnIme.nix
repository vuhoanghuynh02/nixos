# vnIme.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.i18n.inputMethod = lib.mkIf (config.myOptions.laptop.enable) {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [ fcitx5-bamboo ];
  };
}
