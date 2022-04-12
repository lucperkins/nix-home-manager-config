{ pkgs }:

let
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

  pythonTools = with pkgs.python.pkgs; [
    pip
  ];

  macTools = with pkgs.darwin.apple_sdk.frameworks; [
    CoreServices
    Foundation
    Security
  ];

  homePackages = with pkgs; [
    age
    asciinema
    bat
    bazelisk
    buf
    cargo-edit
    cargo-make
    cargo-udeps
    coreutils
    cue
    deno
    dhall
    doctl
    doppler
    findutils
    gotools
    heroku
    htmltest
    httpie
    hugo
    jq
    keybase
    kubectx
    kubectl
    libiconv
    minikube
    ncurses
    nodejs_latest
    pinentry_mac
    protobuf
    rbenv
    reattach-to-user-namespace
    rustup
    subversion
    terraform
    terragrunt
    tree
    vagrant
    vale
    vector
    yarn
    youtube-dl
  ];
in macTools ++ homePackages ++ gitTools ++ nixTools ++ pythonTools
