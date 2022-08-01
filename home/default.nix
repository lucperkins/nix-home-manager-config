{ homeDirectory, nixpkgs, pkgs, system, username }:

let
  stateVersion = "22.11";
  packages = import ./packages.nix { inherit homeDirectory pkgs; };
  editor = "nvim";
in {
  # initial home config
  home = { inherit homeDirectory packages stateVersion username; };

  nix = {
    package = pkgs.nix;
    settings = {
      sandbox = true;
      substituters = [ "https://cache.nixos.org" ];
      experimental-features = [ "flakes" "nix-command" ];
    };
  };

  nixpkgs = { config = { allowUnfree = true; }; };

  # Allow Nix to handle my fonts
  fonts = { fontconfig = { enable = true; }; };

  programs =
    import ./programs.nix { inherit editor homeDirectory pkgs username; };

  xdg = import ./xdg.nix;
}
