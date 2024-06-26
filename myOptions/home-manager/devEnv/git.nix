# git.nix
{
  config,
  lib,
  ...
}: {
  config.programs.git = {
    enable = lib.mkDefault config.myOptions.devEnv.enable;

    userName = lib.mkDefault "Vu Hoang Huynh";
    userEmail = lib.mkDefault "vuhoanghuynh02@outlook.com";
    lfs.enable = lib.mkDefault true;
    extraConfig.init.defaultBranch = lib.mkDefault "main";
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
