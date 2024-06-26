# desktop_shared.nix

{ config, ... }:
{
  imports = [
    ./base_shared.nix
    ./desktop_packages.nix
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    "${config.xdg.configHome}/ktrashrc".text = ''
      [${config.home.homeDirectory}/.local/share/Trash]
      Days=${config.custom.cleanAfter} 
      LimitReachedAction=1
      Percent=10
      UseSizeLimit=false
      UseTimeLimit=true
    '';
  };

  dconf.enable = true;
}
