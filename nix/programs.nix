{ editor
, homeDirectory
, pkgs
, username }:

{
  bat.enable = true;

  broot = {
    enable = true;
    enableZshIntegration = true;
  };

  direnv = {
    enable = true;
    enableZshIntegration = true;
    
    nix-direnv.enable = true;
  };

  dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  exa = {
    enable = true;
    enableAliases = true;
  };

  fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  gh = {
    enable = true;
    settings = {
      inherit editor;
      git_protocol = "ssh";
      prompt = "enabled";
      aliases = {
        pvw = "pr view --web";
        rvw = "repo view --web";
      };
    };
  };

  git = import ./git.nix { inherit pkgs; };

  go = {
    enable = true;
    package = pkgs.go_1_18;
  };

  gpg.enable = true;

  home-manager = {
    enable = true;
    path = "…";
  };

  jq.enable = true;

  just = {
    enable = true;
    enableZshIntegration = true;
  };

  keychain = {
    enable = true;
    enableZshIntegration = true;
  };

  neovim = import ./neovim.nix { inherit (pkgs) vimPlugins; };

  nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  nushell = {
    enable = true;
  };

  pandoc = {
    enable = true;
    defaults = {
      metadata = {
        author = "Luc Perkins";
      };
    };
  };

  starship = import ./starship.nix;

  tmux = import ./tmux.nix;

  vscode = import ./vscode.nix { inherit pkgs; };

  zsh = import ./zsh.nix { inherit homeDirectory pkgs username; };
}