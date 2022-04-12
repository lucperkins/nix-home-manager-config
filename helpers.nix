{
  nixpkgsRef = revision:
    import (fetchTarball "https://github.com/nixos/nixpkgs/archive/${revision}.tar.gz") {};
}