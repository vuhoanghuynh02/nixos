# cosmic.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.myOptions.cosmic.enable) {
    home.packages = with pkgs; [
      resources
    ];
  };
}
