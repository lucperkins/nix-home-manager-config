{ pkgs, later }:

let
  overrides = with later; [
    buf
    cue
    go
  ];

  fonts = with pkgs; [
    (nerdfonts.override { fonts = (import ./fonts.nix); })
  ];

  gitTools = with pkgs.gitAndTools; [
    diff-so-fancy
    git-codeowners
    gitflow
    gh
  ];

  nixTools = with pkgs; [
    cachix
    lorri
  ];

  homePackages = with pkgs; [
    age
    asciinema
    bat
    bazelisk
    cargo-edit
    cargo-make
    cargo-udeps
    deno
    dhall
    doctl
    doppler
    elixir
    heroku
    goimports
    htmltest
    httpie
    hugo
    jq
    keybase
    kubectx
    kubectl
    minikube
    nodejs_latest
    protobuf
    rbenv
    reattach-to-user-namespace
    rustup
    terraform
    terragrunt
    tree
    vagrant
    vale
    vector
    yarn
    youtube-dl
  ];
in homePackages ++ gitTools ++ nixTools ++ fonts ++ overrides
