let
  system = builtins.currentSystem;
  stateVersion = "22.05";
  username = "lucperkins";
  homeDirectory = "/Users/${username}";

  # The specific revision of nixpkgs I pin everything to
  nigpkgsRev = "9c544193df8a1e7f083a7d3261f78e71f588f3e7";

  # The pinned nixpkgs I'll use throughout
  pkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/${nigpkgsRev}.tar.gz") {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };

  # The total set of packages to install
  packages = import ./packages.nix { inherit pkgs ; };
in {
  # initial home config
  home = {
    inherit homeDirectory packages stateVersion username;
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
      SHELL = "$HOME/.nix-profile/bin/zsh";
    };
  };

  # nixpkgs configuration
  nixpkgs = {
    config = {
      inherit system;
      allowUnfree = true;
      allowUnsupportedSystem = true;
      experimental-features = "nix-command flakes";
      extra-platforms = "aarch64-darwin x86_64-linux";
    };
  };

  # Allow Nix to handle my fonts
  fonts = {
    fontconfig = {
      enable = true;
    };
  };

  # Home Manager extensions
  programs = {
    direnv = {
      enable = true;
      
      nix-direnv = {
        enable = true;
      };
    };

    go = {
      enable = true;
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

    starship = import ./starship.nix {
      inherit pkgs;
    };

    gpg = {
      enable = true;
    };

    # alacritty = import ./alacritty.nix;

    git = import ./git.nix { inherit pkgs; };

    tmux = import ./tmux.nix;

    vscode = import ./vscode.nix { inherit pkgs; };

    zsh = import ./zsh.nix { inherit pkgs; };
  };
}
