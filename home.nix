{ config, ... }:

let
  nigpkgsRev = "22.05-pre";

  # An arbitrary commit that's much "later" than the release channel
  laterRev = "baca640798571218743fca3cd665194b3af9d16b";

  later = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/${laterRev}.tar.gz") {};
  pkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/${nigpkgsRev}.tar.gz") {};

  externalPackages = import ./packages.nix { inherit pkgs later; };
  customScripts = import ./scripts.nix { writeScriptBin = pkgs.writeScriptBin; };

  allPackages = externalPackages ++ customScripts;
in {
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
    extra-platforms = [ "aarch64-darwin" ];
    experimental-features = "nix-command flakes";
  };

  fonts = {
    fontconfig = {
      enable = true;
    };
  };

  programs = {
    go = {
      enable = true;
    };

    direnv = {
      enable = true;
      
      nix-direnv = {
        enable = true;
      };
    };
    
    home-manager = {
      enable = true;
      path = "…";
    };

    exa = {
      enable = true;
      enableAliases = true;
    };

    neovim = import ./neovim.nix { vimPlugins = pkgs.vimPlugins; };

    starship = import ./starship.nix;

    gpg = {
      enable = true;
    };

    # alacritty = import ./alacritty.nix;

    git = import ./git.nix { inherit pkgs; };

    tmux = import ./tmux.nix;

    vscode = import ./vscode.nix { inherit pkgs; };

    zsh = import ./zsh.nix { fetchFromGitHub = pkgs.fetchFromGitHub; };
  };

  home = {
    username = "lucperkins";
    homeDirectory = "/Users/lucperkins";
    packages = allPackages;
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
      SHELL = "$HOME/.nix-profile/bin/zsh";
    };
  };

  home.stateVersion = "21.05";
}
