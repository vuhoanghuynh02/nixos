# flake.nix

{
  inputs = {
    # If you don't have time to report, do not use unstable.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self
    , nixpkgs
      # , nixpkgs-unstable
    , ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      common_modules = [
        inputs.home-manager.nixosModules.default
        # {
        #   nixpkgs.overlays = [
        #     (final: prev: {
        #       unstable = import nixpkgs-unstable {
        #         inherit system;
        #         config.allowUnfree = true;
        #       };
        #     })
        #   ];
        # }
      ];
    in
    {
      nixosConfigurations = {
        vincent_for_now = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/vincent_for_now/configuration.nix
          ] ++ common_modules;
        };

        server = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/server/configuration.nix
          ] ++ common_modules;
        };

        sophie = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/sophie/configuration.nix
          ] ++ common_modules;
        };
      };
    };
}
