# temp.nix
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
  imports = [inputs.nixos-cosmic.nixosModules.default];
  nix.settings = {
    substituters = ["https://cosmic.cachix.org"];
    trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
  };

  # services.ollama = mkIf cfg.devEnv.enable {
  #   enable = true;
  #   home = cfg.homeDirectory;
  # };
}
