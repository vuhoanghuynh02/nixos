# keyboard.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.myOptions.laptop.enable) {
    services.xserver.xkb = {
      layout = lib.mkDefault "us";
      variant = lib.mkDefault "carpalx-full";
    };
    console.useXkbConfig = lib.mkDefault true;

    i18n.inputMethod = {
      enable = lib.mkDefault true;
      type = lib.mkDefault "fcitx5";
      fcitx5 = {
        waylandFrontend = lib.mkDefault true;
        addons = with pkgs; [fcitx5-bamboo];
      };
    };
  };
}
