{ homeDirectory, pkgs }:

let
  inherit (pkgs) darwin gitAndTools nerdfonts nodePackages python39Packages;

  # Some custom helper scripts I use
  customScripts = import ./scripts.nix {
    inherit homeDirectory;
    inherit (pkgs) writeScriptBin;
    inherit (pkgs.lib) fakeHash;
  };

  # Fonts that I use in my environment
  fontList = (import ./static.nix).fontList;

  fonts = with nerdfonts; [ (override { fonts = fontList; }) ];

  gitTools = with gitAndTools; [ diff-so-fancy git-codeowners gitflow ];

  nixTools = with pkgs; [ cachix lorri ];

  macTools = with darwin.apple_sdk.frameworks; [
    CoreServices
    Foundation
    Security
  ];

  rustTools = with pkgs; [ cargo-edit cargo-make cargo-profiler cargo-udeps ];

  python = with pkgs; [ python39 ];

  pythonTools = with python39Packages; [ pip virtualenv ];

  nodeTools = with nodePackages; [ pnpm ];

  customPackages = import ./custom.nix { inherit pkgs; };

  homePackages = with pkgs; [
    age
    asciinema
    bazelisk
    buf
    bun
    cmake
    coreutils
    cue
    dapr-cli
    #deno (currently broken)
    dhall
    dive
    doctl
    doppler
    findutils
    gcc
    gleam
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
    nodejs-16_x
    pinentry_mac
    protobuf
    rbenv
    reattach-to-user-namespace
    rustup
    skopeo
    sqlite
    statix
    subversion
    terraform
    terragrunt
    tree
    treefmt
    vagrant
    vale
    yarn
    youtube-dl
  ];
in customScripts ++ fonts ++ macTools ++ gitTools ++ nixTools ++ rustTools
++ python ++ pythonTools ++ nodeTools ++ homePackages ++ customPackages
