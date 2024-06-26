# server_shared.nix

{ config, lib, ... }:
{
  imports = [
    ./base_shared.nix
  ];

  services.openssh.enable = true;

  system.autoUpgrade = {
    operation = "switch"; # for security reason
    allowReboot = true;
    rebootWindow.lower = "01:00";
    rebootWindow.upper = "02:00";
  };
  services.getty.autologinUser = config.custom.userName;

  services.logind.lidSwitch = "lock";
}
