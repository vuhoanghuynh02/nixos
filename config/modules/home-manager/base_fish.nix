# base_fish.nix

{ config, ... }:
{
  programs.fish = {
    shellAliases = {
      "neofetch" = "neofetch && date";
      "clear" = "clear && neofetch";
    };
  };
}
