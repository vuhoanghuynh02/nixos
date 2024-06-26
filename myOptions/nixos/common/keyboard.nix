# keyboard.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = mkIf (cfg.hosts.vincent-home.enable || cfg.hosts.vincent-work.enable || cfg.hosts.sophie.enable) {
    services.xserver.xkb = {
      layout = mkDefault "us";
      variant = mkDefault "carpalx-full";
    };
    console.useXkbConfig = mkDefault true;

    i18n.inputMethod = {
      enable = mkDefault true;
      type = mkDefault "fcitx5";
      fcitx5 = {
        waylandFrontend = mkDefault true;
        addons = with pkgs; [fcitx5-bamboo];
      };
    };
  };
}
