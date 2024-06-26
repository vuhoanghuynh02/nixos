# vm-host.nix
{
  config,
  lib,
  ...
}: {
  config = {
    # programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = lib.mkIf (config.programs.virt-manager.enable) (lib.mkDefault true);
    users.users.${config.myOptions.userName}.extraGroups = lib.mkIf (config.programs.virt-manager.enable) ["libvirtd"];
  };
}
