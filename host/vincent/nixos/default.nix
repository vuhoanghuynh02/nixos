# default.nix
{...}: {
  imports = [
    ../../../myOptions/nixos
    ../common
    # default.nix
    ./misc.nix
  ];
}
