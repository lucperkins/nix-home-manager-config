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

      overrides = (import ./nix/static.nix).overrides;
      overlays = import ./nix/overlays.nix {
        inherit (overrides) hugo;
      };

      pkgs = import nixpkgs {
        inherit overlays system;

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
