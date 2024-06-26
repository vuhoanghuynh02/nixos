# flake.nix
{
  # nixConfig = {
  #   extra-substituters = [
  #     "https://nix-community.cachix.org"
  #   ];
  #   extra-trusted-public-keys = [
  #     "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  #   ];
  # };

  inputs = {
    sharedInputs.url = "/home/vincent/Nextcloud/nixos/flakes/shared";
    nixpkgs.follows = "sharedInputs/nixpkgs-home";
    home-manager.follows = "sharedInputs/home-manager";
    fenix.follows = "sharedInputs/fenix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = false;
    };
  in {
    homeConfigurations."vincent" = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {inherit inputs;};
      inherit pkgs;
      modules = [/home/vincent/Nextcloud/nixos/host/vincent/home-manager];
    };
  };
}
