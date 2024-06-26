# misc.nix
{
  config,
  lib,
  inputs,
  ...
}: {
  config = {
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    # You can update fHome Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "24.11";
    # home.stateVersion = "25.05";

    home.sessionVariables.CURRENT_HOME_FLAKE = inputs.self.outPath;

    home.file."Nextcloud/.sync-exclude.lst" = let
      ignores = config.programs.git.ignores;
    in
      lib.mkIf (ignores != []) {
        text = lib.concatStringsSep "\n" ignores + "\n";
      };
  };
}
