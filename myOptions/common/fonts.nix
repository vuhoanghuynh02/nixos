# fonts.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.myOptions.fonts = {
    nerd = lib.mkOption {
      type = lib.types.str;
      default = "BlexMono Nerd Font";
    };
    # mono = lib.mkOption {
    #   type = lib.types.str;
    #   default = "Roboto Mono";
    # };
    sans = lib.mkOption {
      type = lib.types.str;
      default = "Open Sans";
    };
  };

  config = {
    myOptions.packages = with pkgs; [
      (nerdfonts.override {fonts = ["IBMPlexMono"];})
    ];
    fonts.fontconfig = {
      enable = lib.mkDefault true;
      defaultFonts = {
        sansSerif = [config.myOptions.fonts.sans];
        monospace = [config.myOptions.fonts.nerd];
      };
    };
  };
}
