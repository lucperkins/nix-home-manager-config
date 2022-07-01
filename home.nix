let
  # Borrow helper functions
  helpers = import ./helpers.nix;

  # The specific revision of nixpkgs I pin everything to
  nigpkgsRev = "9c544193df8a1e7f083a7d3261f78e71f588f3e7";

  # The pinned nixpkgs I'll use throughout
  pkgs = helpers.nixpkgsRef nigpkgsRev;

  # I define the external packages I want to use in a separate file
  externalPackages = import ./packages.nix { inherit pkgs ; };

  # Some custom helper scripts I use
  customScripts = import ./scripts.nix { writeScriptBin = pkgs.writeScriptBin; };

  # Fonts that I use in my environment
  fonts = with pkgs; [
    (nerdfonts.override { fonts = (import ./fonts.nix); })
  ];

  # The total set of packages to install
  packages = externalPackages ++ customScripts ++ fonts;

  jdk = pkgs.jdk8;
in {
  # nixpkgs configuration
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnsupportedSystem = true;
      system = "aarch64-darwin";
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

    zsh = import ./zsh.nix { inherit pkgs; inherit jdk; };
  };

  home = {
    username = "lucperkins";
    homeDirectory = "/Users/lucperkins";
    inherit packages;
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
      SHELL = "$HOME/.nix-profile/bin/zsh";
    };
  };

  home.stateVersion = "22.05";
}
