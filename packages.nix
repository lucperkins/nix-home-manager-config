{ homeDirectory
, pkgs }:

let
  # Some custom helper scripts I use
  customScripts = import ./scripts.nix {
    inherit (pkgs) writeScriptBin;
    inherit homeDirectory;
  };

  # Fonts that I use in my environment
  fontList = (import ./static.nix).fontList;

  fonts = with pkgs.nerdfonts; [
    (override { fonts = fontList; })
  ];

  gitTools = with pkgs.gitAndTools; [
    diff-so-fancy
    git-codeowners
    gitflow
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
in customScripts ++ fonts ++ macTools ++ homePackages ++ gitTools ++ nixTools ++ rustTools ++ python ++ pythonTools
