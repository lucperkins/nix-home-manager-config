{ pkgs, later }:

let
  overrides = with later; [
    buf
    cue
  ];

  fonts = with pkgs; [
    (nerdfonts.override { fonts = (import ./fonts.nix); })
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
  ];

  homePackages = with pkgs; [
    age
    bat
    bazelisk
    cargo-edit
    cargo-make
    deno
    dhall
    doctl
    doppler
    elixir
    heroku
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
    vector
    yarn
    youtube-dl
  ];
in homePackages ++ gitTools ++ nixTools ++ fonts ++ overrides
