{
  description = "Config as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "aarch64-darwin";
      username = "lucperkins";
      stateVersion = "22.11";
      homeDirectory = "/Users/${username}";

      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };

      homeConfig = (import ./home.nix { inherit homeDirectory pkgs stateVersion system username; });
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          homeConfig
        ];
      };
    };
}