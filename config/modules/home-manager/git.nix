# git.nix

{ config, lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig.init.defaultBranch = "main";
    ignores = [
      "temp_*"

      "node_modules/"

      ".direnv/"
      ".envrc"

      "*.code-workspace"
      ".vscode/"

      "__pycache__/"
      ".ipynb_checkpoints./"

      # Syncthing stuff
      ".stignore"
      ".stfolder/"
      ".stversions/"

      # Nextcloud stuff
      ".nextcloudsync.log"
      ".sync-exclude.lst"
      ".sync_456bcda2960f.db"
      ".sync_456bcda2960f.db-shm"
      ".sync_456bcda2960f.db-wal"
      "_.sync-exclude.lst"
    ];
  };
}
