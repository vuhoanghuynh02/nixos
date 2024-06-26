# flake.nix
{
  # nixConfig = {
  #   extra-substituters = [
  #     "https://nix-community.cachix.org"
  #     "https://cosmic.cachix.org/"
  #   ];
  #   extra-trusted-public-keys = [
  #     "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  #     "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
  #   ];
  # };

  inputs = {
    sharedInputs.url = "/home/vincent/Nextcloud/nixos/flakes/shared";
    nixpkgs.follows = "sharedInputs/nixpkgs-nixos";
    nixos-cosmic.follows = "sharedInputs/nixos-cosmic";
    nix-snapd.follows = "sharedInputs/nix-snapd";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    # lib.getName = (import nixpkgs {inherit system;}).lib.getName;
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = false;
      # config.allowUnfreePredicate = pkg:
      #   builtins.elem (lib.getName pkg) [
      #   ];
    };
  in {
    nixosConfigurations."vincent" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      inherit pkgs;
      modules = [/home/vincent/Nextcloud/nixos/host/vincent/nixos];
    };
  };
}
