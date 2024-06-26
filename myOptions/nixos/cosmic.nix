# cosmic.nix
{
  config,
  lib,
  ...
}: {
  # imports = [
  #   inputs.nixos-cosmic.nixosModules.default
  # ];

  config = lib.mkIf (config.myOptions.cosmic.enable) {
    nix.settings = {
      substituters = ["https://cosmic.cachix.org/"];
      trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
    };
    environment.sessionVariables.NIXOS_OZONE_WL = lib.mkDefault "1";

    services.desktopManager.cosmic.enable = lib.mkDefault true;
    services.displayManager.cosmic-greeter.enable = lib.mkDefault true;
  };
}
