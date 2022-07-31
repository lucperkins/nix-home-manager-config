{ homeDirectory }:

{
  enable = true;
  shellAliases = {
    grep = "grep --color=auto";
    diff = "diff --color=auto";
    dc = "docker compose";
    szsh = "source ~/.zshrc";
    cat = "bat";
    garbage = "nix-collect-garbage";

    # Nix stuff (https://alexfedoseev.com/blog/post/nix-time)
    xx = "home-manager switch --flake $HOME/.config/nixpkgs && source ~/.zshrc";
    xs = "nix-env --query --available --attr-path ";
    xsp = "nix-env --file '<nixpkgs>' --query --available --attr-path -A ";
    xgc = "nix-env --delete-generations old && nix-store --gc";

    # Direnv helpers
    da = "direnv allow";
    dr = "direnv reload";
  };
  enableAutosuggestions = true;
  enableCompletion = true;
  autocd = true;
  initExtra = (builtins.readFile ../scripts/init.sh);
}
