# kde.nix

{ config, lib, pkgs, ... }:
{
  home.file. "${config.xdg.configHome}/ktrashrc".text = ''
    [${config.custom.homeDirectory}/.local/share/Trash]
    Days=${config.custom.cleanAfter} 
    LimitReachedAction=1
    Percent=10
    UseSizeLimit=false
    UseTimeLimit=true
  '';
}
