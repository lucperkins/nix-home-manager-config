{ pkgs }:

let
  fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
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
    age
    bat
    buf
    cargo-make
    dhall
    doctl
    elixir
    heroku
    httpie
    hugo
    jq
    keybase
    nodejs_latest
    packer
    rbenv
    reattach-to-user-namespace
    rustup
    terraform
    vagrant
    yarn
    youtube-dl
  ];
in homePackages ++ gitTools ++ nixTools ++ fonts
