{ writeScriptBin }:

let
  hasher = writeScriptBin "hasher" ''
    nix-hash --type sha256 --flat --base32 <(echo $1) | cut -c 1-32
  '';

  git-hash = writeScriptBin "git-hash" ''
    nix-prefetch-url --unpack https://github.com/$1/$2/archive/$3.tar.gz
  '';

  wo = writeScriptBin "wo" ''
    readlink $(which $1)
  '';

  build-push = writeScriptBin "build-push" ''
    nix-build '<nixpkgs>' -A $1 | cachix push lucperkins-dev && rm result
  '';

  run = writeScriptBin "run" ''
    nix-shell --pure --run "$@"
  '';

  all = [ hasher git-hash wo build-push run ];
in all