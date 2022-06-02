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

  rustTools = with pkgs; [
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
    cmake
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
    keybase
    kubectx
    kubectl
    libiconv
    litestream
    minikube
    ncurses
    nodejs_latest
    pandoc
    pinentry_mac
    protobuf
    rbenv
    reattach-to-user-namespace
    rustup
    sqlite
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
in macTools ++ homePackages ++ gitTools ++ nixTools ++ pythonTools ++ rustTools
