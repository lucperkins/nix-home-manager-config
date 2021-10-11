{ pkgs }:

let
  gitTools = with pkgs.gitAndTools; [
    delta
    diff-so-fancy
    git-codeowners
    gitflow
    gh
  ];

  nixTools = with pkgs; [
    cachix
    lorri
    niv
  ];

  homePackages = with pkgs; [
    youtube-dl
    packer
    vagrant
    nodejs
    age
    elixir
    jq
    terraform
    doctl
    yarn
    cue
    hugo
    bat
    httpie
    dhall
    rustup
    cargo-make
  ];
in homePackages ++ gitTools ++ nixTools
