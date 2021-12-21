{ pkgs }:

let
  rubyTools = with pkgs.rubyPackages; [
    rbenv
  ];

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
    nodejs_latest
    age
    elixir
    jq
    terraform
    doctl
    yarn
    hugo
    bat
    heroku
    httpie
    dhall
    rustup
    cargo-make
    wasmer
  ];
in homePackages ++ gitTools ++ nixTools
