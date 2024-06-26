# base_shared.nix

{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ../../hardware-configuration.nix
    ../../situation-dependence.nix
    inputs.home-manager.nixosModules.default
    ../options.nix
    ./base_power-save.nix
    ./base_upgrade.nix
    ./base_security.nix
  ];

  nixpkgs.config.allowUnfree = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.sessionVariables.CONFIG_STORE_PATH = inputs.self.outPath;

  services.boinc.enable = true;

  zramSwap.enable = true;
  zramSwap.memoryPercent = 400;

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "C.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_DK.UTF-8";

  home-manager = {
    users.${config.custom.userName} = import ../../hosts/${config.custom.userName}/home.nix;
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

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      default = "saved";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
}
