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

        config = {
          allowUnfree = true;
          xdg = { configHome = "${homeDirectory}"; };
        };
      };
      homeConfig = (import ./home {
        inherit homeDirectory nixpkgs pkgs system username;
      });

      inherit (home-manager.lib) homeManagerConfiguration;
    in {
      homeConfigurations.${username} = homeManagerConfiguration {
        inherit pkgs;

        modules = [ homeConfig ];

        extraSpecialArgs = { inherit nixpkgs; };
      };
    };
}
