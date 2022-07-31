{ fakeHash, homeDirectory, writeScriptBin }:

let
  build-push = writeScriptBin "build-push" ''
    nix-build '<nixpkgs>' -A $1 | cachix push lucperkins-dev && rm result
  '';

  fake = writeScriptBin "fakeHash" ''
    echo "${fakeHash}"
  '';

  hasher = writeScriptBin "hasher" ''
    nix-hash --type sha256 --flat --base32 <(echo $1) | cut -c 1-32
  '';

  git-hash = writeScriptBin "git-hash" ''
    nix-prefetch-url --type sha256 --unpack https://github.com/$1/$2/archive/$3.tar.gz
  '';

  wo = writeScriptBin "wo" ''
    readlink $(which $1)
  '';

  run = writeScriptBin "run" ''
    nix-shell --pure --run "$@"
  '';

  xr = writeScriptBin "xr" ''
    if [ -z "$1" ]; then
      echo "no executable specified"
      exit 1
    fi

    nix run nixpkgs#$1 -- $2
  '';

  all = [ build-push fake git-hash hasher run wo xr ];
in all