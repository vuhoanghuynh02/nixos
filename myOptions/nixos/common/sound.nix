# sound.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions.hosts;
  soundEnabled = cfg.vincent-home.enable || cfg.vincent-work.enable || cfg.sophie.enable;
in {
  services.pipewire = {
    enable = mkDefault soundEnabled;
    pulse.enable = mkDefault soundEnabled;
  };
  boot.blacklistedKernelModules = mkIf (!config.services.pipewire.enable) ["snd_hda_intel"];

  programs.dconf.enable = mkIf soundEnabled (mkDefault true); # for home-manager services.easyeffects.enable
}
