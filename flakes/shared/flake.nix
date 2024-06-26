# flake.nix
{
  # If you don't spend time to debug and report, do not use the unstable branch.
  inputs = {
    nixpkgs-stable.follows = "nixos-cosmic/nixpkgs-stable";
    # nixpkgs-unstable.follows = "nixos-cosmic/nixpkgs";
    nixos-cosmic.inputs.nixpkgs.follows = "nixpkgs-stable";

    nixpkgs-nixos.follows = "nixpkgs-stable";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    nixpkgs-home.follows = "nixpkgs-stable";
    # nixpkgs-home.follows = "nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-home";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs-home";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {...}: {};
}
