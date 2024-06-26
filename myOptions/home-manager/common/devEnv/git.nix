# git.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config.programs.git = {
    enable = mkDefault cfg.devEnv.enable;

    userName = mkDefault "Vu Hoang Huynh";
    userEmail = mkDefault "vuhoanghuynh02@outlook.com";
    lfs.enable = mkDefault true;
    extraConfig.init.defaultBranch = mkDefault "main";
    ignores = [
      ".tmp*"
      "*.code-workspace"
      "target"
      ".git.backup"
      "core"

      ".bzr"
      ".direnv"
      ".eggs"
      ".git"
      ".git-rewrite"
      ".hg"
      ".ipynb_checkpoints"
      ".mypy_cache"
      ".nox"
      ".pants.d"
      ".pyenv"
      ".pytest_cache"
      ".pytype"
      ".ruff_cache"
      ".svn"
      ".tox"
      ".venv"
      ".vscode"
      "__pycache__"
      "__pypackages__"
      "_build"
      "buck-out"
      "build"
      "dist"
      "node_modules"
      "site-packages"
      "venv"

      ########## Sync ##########
      # Syncthing stuff
      ".stignore"
      ".stfolder/"
      ".stversions/"
      # Nextcloud stuff
      ".nextcloudsync.log"
      ".sync-exclude.lst"
      ".sync_*.db"
      ".sync_*.db-shm"
      ".sync_*.db-wal"
      ##############################
    ];
  };
}
