# brave.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.myOptions.brave.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config.programs.chromium = lib.mkIf (config.myOptions.brave.enable) {
    enable = lib.mkDefault true;
    package = lib.mkDefault pkgs.brave;
    commandLineArgs = [
      "--enable-wayland-ime"
      "--wayland-text-input-version=3"
    ];
    dictionaries = [pkgs.hunspellDictsChromium.en_US];
    extensions = [
      {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
      {id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";} # Dark Reader
      {id = "fnaicdffflnofjppbagibeoednhnbjhg";} # floccus
      {id = "nibjojkomfdiaoajekhjakgkdhaomnch";} # IPFS Companion
      {id = "oldceeleldhonbafppcapldpdifcinji";} # LanguageTool
      {id = "chphlpgkkbolifaimnlloiipkdnihall";} # OneTab
      {id = "fbapmaboedchhgjolcnpfgoanbfajchl";} # stutter
      {id = "gfbliohnnapiefjpjlpjnehglfpaknnc";} # Surfingkeys
    ];
  };
}
