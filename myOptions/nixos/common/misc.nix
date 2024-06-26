# misc.nix
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = {
    environment.systemPackages = cfg.packages;

    i18n.extraLocaleSettings.LC_TIME = mkDefault "en_DK.UTF-8";
    time.timeZone = mkDefault "Asia/Ho_Chi_Minh";

    users.users.${cfg.userName} = {
      isNormalUser = mkDefault true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
    users.defaultUserShell = pkgs.fish;
    programs.fish.enable = mkDefault true;

    hardware.enableRedistributableFirmware = mkDefault true;
    systemd.coredump.enable = mkDefault false;
    programs.nix-ld.enable = mkDefault true;

    environment.sessionVariables.CURRENT_NIXOS_FLAKE = mkDefault inputs.self.outPath;
    hardware.bluetooth.enable = mkDefault (cfg.hosts.vincent-home.enable || cfg.hosts.vincent-work.enable || cfg.hosts.sophie.enable);

    environment.sessionVariables.NIXOS_OZONE_WL = mkDefault "1";
  };
}
