{ pkgs }:

let
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
    niv
  ];

  homePackages = with pkgs; [
    age
    bat
    buf
    cargo-make
    deno
    dhall
    doctl
    doppler
    elixir
    heroku
    httpie
    hugo
    jq
    keybase
    kubectx
    kubectl
    minikube
    nodejs_latest
    packer
    rbenv
    reattach-to-user-namespace
    rustup
    terraform
    terragrunt
    vagrant
    vector
    yarn
    youtube-dl
  ];
in homePackages ++ gitTools ++ nixTools ++ fonts
