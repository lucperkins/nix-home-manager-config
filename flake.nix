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
      username = "lucperkins";
      system = "aarch64-darwin";
      homeDirectory = "/Users/${username}";

      pkgs = import nixpkgs {
        inherit system;

        overlays = import ./nix/overlays.nix;

        config = {
          allowUnfree = true;
          xdg = {
            configHome = "${homeDirectory}";
          };
        };
      };
      homeConfig = (import ./nix/home.nix {
        inherit homeDirectory pkgs system username;
      });
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          homeConfig
        ];
      };
    };
}
