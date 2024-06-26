# flake.nix
{
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
      config.cudaSupport = true;
    };
  in {
    homeConfigurations."vincent" = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {inherit inputs;};
      inherit pkgs;
      modules = [/home/vincent/Nextcloud/nixos/host/vincent/home-manager];
    };
  };
}
