# sound.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.myOptions.sound.enable) {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
    hardware.pulseaudio.enable = false;
    # services.pulseaudio.enable = false;

    programs.dconf.enable = lib.mkDefault config.myOptions.laptop.enable; # for home-manager services.easyeffects.enable
  };
}
