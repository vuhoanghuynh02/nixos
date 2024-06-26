# firefox.nix
{
  config,
  lib,
  ...
}: {
  options.myOptions.firefox.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config.programs.firefox = lib.mkIf (config.myOptions.firefox.enable) {
    enable = lib.mkDefault true;
    # See https://codeberg.org/librewolf/settings/src/branch/master/librewolf.cfg
    # and about:config
    profiles."${config.myOptions.userName}" = {
      id = lib.mkDefault 0;
      settings = {
        "browser.urlbar.update2.engineAliasRefresh" = lib.mkDefault true;
        "browser.contentblocking.category" = lib.mkDefault "standard";
        "browser.formfill.enable" = lib.mkDefault false;
        "sidebar.revamp" = lib.mkDefault true;
        "sidebar.verticalTabs" = lib.mkDefault true;
        "sidebar.visibility" = lib.mkDefault "always-show";
        "extensions.pocket.enabled" = lib.mkDefault false;
      };
    };
  };
}
