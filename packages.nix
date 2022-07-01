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

  macTools = with pkgs.darwin.apple_sdk.frameworks; [
    CoreServices
    Foundation
    Security
  ];

  rustTools = with pkgs; [
    cargo-edit
    cargo-make
    cargo-udeps
  ];

  python = with pkgs; [
    python39
  ];

  pythonTools = with pkgs.python39Packages; [
    pip
    virtualenv
  ];

  homePackages = with pkgs; [
    age
    asciinema
    bat
    bazelisk
    buf
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
    vale
    yarn
    youtube-dl
  ];
in macTools ++ homePackages ++ gitTools ++ nixTools ++ rustTools ++ python ++ pythonTools
