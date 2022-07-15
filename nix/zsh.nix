{ homeDirectory
, pkgs
, username }:

let
  fetchFromGitHub = pkgs.fetchFromGitHub;
in {
  enable = true;
  shellAliases = {
    bazel = "bazelisk";
    grep = "grep --color=auto";
    diff = "diff --color=auto";
    dc = "docker compose";
    szsh = "source ~/.zshrc";
    cat = "bat";
    garbage = "nix-collect-garbage";
    reload = "switch && garbage";
    switch = "home-manager switch --flake $HOME/.config/nixpkgs && source ~/.zshrc";
  };
  enableAutosuggestions = true;
  enableCompletion = true;
  autocd = true;
  initExtra = (builtins.readFile ../scripts/init.sh);
}
