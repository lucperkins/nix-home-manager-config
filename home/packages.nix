{ homeDirectory, pkgs }:

let
  inherit (pkgs) darwin gitAndTools nerdfonts nodePackages python39Packages;

  # Some custom helper scripts I use
  customScripts = import ./scripts.nix {
    inherit homeDirectory;
    inherit (pkgs) writeScriptBin;
    inherit (pkgs.lib) fakeHash;
  };

  fonts = with nerdfonts;
    [ (override { fonts = [ "CascadiaCode" "FiraCode" "JetBrainsMono" ]; }) ];

  gitTools = with gitAndTools;
    [ diff-so-fancy git-codeowners gitflow ]
    ++ (with pkgs; [ git-annex git-crypt ]);

  nixTools = with pkgs; [ cachix lorri ];

  macTools = with darwin.apple_sdk.frameworks; [
    CoreServices
    Foundation
    Security
  ];

  rustTools = with pkgs; [ cargo-edit cargo-make cargo-profiler cargo-udeps ];

  python = with pkgs; [ python39 ];

  pythonTools = with python39Packages; [ httpie pip virtualenv ];

  nodeTools = with nodePackages; [ pnpm ];

  customPackages = import ./custom.nix { inherit pkgs; };

  database = with pkgs; [ postgresql_14 ];

  homePackages = with pkgs; [
    age
    asciinema
    bazelisk
    buf
    bun
    cmake
    comma
    coreutils
    cue
    dagger
    dapr-cli
    dhall
    dive
    doctl
    doppler
    elixir
    findutils
    flyctl
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
    maven
    minikube
    navi
    ncurses
    nixfmt
    nodejs-16_x
    open-policy-agent
    openssl
    pinentry_mac
    pkg-config
    protobuf
    rbenv
    reattach-to-user-namespace
    rustup
    skopeo
    sqlite
    statix
    stow
    subversion
    terraform
    terragrunt
    tree
    treefmt
    vagrant
    vale
    wapm-cli
    wget
    yarn
    youtube-dl
    yt-dlp
  ];

  broken = with pkgs; [ deno materialize ];
in customScripts ++ fonts ++ macTools ++ gitTools ++ nixTools ++ rustTools
++ python ++ pythonTools ++ nodeTools ++ homePackages ++ customPackages
++ database
