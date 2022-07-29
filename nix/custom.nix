{ pkgs }:

let
  inherit (pkgs) darwin fetchCrate libiconv openssl pkg-config;
  inherit (pkgs.lib) optional;
  inherit (pkgs.rustPlatform) buildRustPackage;
  inherit (pkgs.stdenv) isDarwin;

  buildRust = { pname, version, sha256, cargoSha256 }:
    buildRustPackage {
      inherit pname version;

      src = fetchCrate { inherit pname sha256 version; };

      inherit cargoSha256;

      buildInputs = [ libiconv openssl ]
        ++ optional isDarwin [ darwin.apple_sdk.frameworks.Security ];
    };

  cargo-pgx = buildRust {
    pname = "cargo-pgx";
    version = "0.4.5";
    sha256 = "sha256-BcMGa/1ATwLG8VnwItfd5eqmrck/u0MEoR5sA2yuzyQ=";
    cargoSha256 = "sha256-urlwqBCZMxlPEjLLPBhI2lDNTusCSZ1bZu1p8poVrtw=";
  };
in [ cargo-pgx ]
