# virt-manager.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  # programs.virt-manager.enable = true;
  config = mkIf (config.programs.virt-manager.enable) {
    virtualisation.libvirtd = {
      enable = mkDefault true;
      qemu.vhostUserPackages = with pkgs; [virtiofsd];
    };
    users.users.${cfg.userName}.extraGroups = ["libvirtd"];
  };
}
