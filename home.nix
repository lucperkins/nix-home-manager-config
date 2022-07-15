{ homeDirectory
, pkgs
, system
, username }:

let
  stateVersion = "22.11";
  packages = import ./nix/packages.nix { inherit homeDirectory pkgs; };
  editor = "nvim";
in {
  # initial home config
  home = {
    inherit homeDirectory packages stateVersion username;
    sessionVariables = {
      EDITOR = editor;
      TERMINAL = "alacritty";
      SHELL = "$(which zsh)";
    };
  };

  # nixpkgs configuration
  nixpkgs = import ./nix/nixpkgs.nix { inherit system; };

  # Allow Nix to handle my fonts
  fonts = {
    fontconfig = {
      enable = true;
    };
  };

  programs = import ./nix/programs.nix { inherit editor homeDirectory pkgs username; };

  xdg = import ./nix/xdg.nix;
}
