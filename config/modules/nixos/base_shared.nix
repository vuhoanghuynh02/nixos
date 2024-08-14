# base_shared.nix

{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ../../hardware-configuration.nix
    ../../situation-dependence.nix
    inputs.home-manager.nixosModules.default
    ../nixos_home-manager_shared.nix
    ./power-save.nix
    ./upgrade.nix
    ./bootloader.nix
    ./boinc.nix
    ./dnscrypt-proxy.nix
    ./no-temp-on-drive.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.sessionVariables.CONFIG_STORE_PATH = inputs.self.outPath;

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "C.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_DK.UTF-8";

  home-manager = {
    users.${config.custom.userName} = import ../../hosts/${config.custom.configHostName}/home.nix;
    useUserPackages = false;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
  };
  users.users.${config.custom.userName} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  programs.nix-ld.enable = true;
}
