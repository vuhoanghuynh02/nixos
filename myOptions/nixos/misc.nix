# misc.nix
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = {
    i18n.extraLocaleSettings.LC_TIME = lib.mkDefault "en_DK.UTF-8";
    time.timeZone = lib.mkDefault "Asia/Ho_Chi_Minh";

    users.users.${config.myOptions.userName} = {
      isNormalUser = lib.mkDefault true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
    users.defaultUserShell = pkgs.fish;
    programs.fish.enable = lib.mkDefault true;

    hardware.enableRedistributableFirmware = lib.mkDefault true;
    systemd.coredump.enable = lib.mkDefault false;
    programs.nix-ld.enable = lib.mkDefault true;

    environment.sessionVariables.CURRENT_NIXOS_FLAKE = lib.mkDefault inputs.self.outPath;
    hardware.bluetooth.enable = lib.mkDefault config.myOptions.bluetooth.enable;
  };
}
