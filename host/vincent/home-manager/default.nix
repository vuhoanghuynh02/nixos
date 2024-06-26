# default.nix
{...}: {
  imports = [
    ../../../myOptions/home-manager
    ../common
    # default.nix
    ./packages.nix
  ];
}
