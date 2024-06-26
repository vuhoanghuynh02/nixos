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
    home.packages = cfg.packages;

    home.sessionVariables.CURRENT_HOME_FLAKE = inputs.self.outPath;

    home.file."Nextcloud/.sync-exclude.lst" = let
      ignores = config.programs.git.ignores;
    in
      mkIf (ignores != []) {
        text = concatStringsSep "\n" ignores + "\n";
      };

    services.nextcloud-client.startInBackground = mkDefault true;
  };
}
