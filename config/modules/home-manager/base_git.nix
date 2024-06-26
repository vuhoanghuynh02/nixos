# base_git.nix

{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig.init.defaultBranch = "main";
    ignores = [
      ".direnv"
      ".envrc"
      "*.code-workspace"
      ".vscode"
      "__pycache__"
      ".ipynb_checkpoints"
      "temp_*"

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
