# emacs.nix
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf (config.myOptions.devEnv.enable) {
    xdg.configFile = let
      emacsDir = ../../.config/emacs;
    in {
      "eshell".source = emacsDir + "/eshell";
      "images".source = emacsDir + "/images";
      "scripts".source = emacsDir + "/scripts";
      "themes".source = emacsDir + "/themes";
      "config.el".source = emacsDir + "/config.el";
      "early-init.el".source = emacsDir + "/early-init.el";
    };

    nixpkgs.overlays = [(import inputs.emacs-overlay)];

    # for now - begin
    # nixpkgs.config.allowUnfreePredicate =
    #   pkg:
    #   builtins.elem (lib.getName pkg) [
    #     "code"
    #     "vscode"
    #   ];
    # for now - end

    home.packages = with pkgs; [
      jetbrains-mono
      ubuntu-classic
      # for now - begin
      # vscode-fhs
      # for now - end

      (pkgs.emacsWithPackagesFromUsePackage {
        # config = config.xdg.configFile."emacs/config.el".source;
        config = /. + "${config.xdg.configHome}/emacs/config.el";
        package = pkgs.emacs-pgtk;
        alwaysEnsure = true;

        # alwaysTangle = true;
        # defaultInitFile = true;
        # extraEmacsPackages =
        #   epkgs: with epkgs; [
        #
        #   ];
      })
    ];
  };
}
