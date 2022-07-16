{ system }:

{
  config = {
    inherit system;
    allowBroken = true;
    allowUnfree = true;
    allowUnsupportedSystem = true;
    sandbox = true;
    experimental-features = "nix-command flakes";
    system-features = "benchmark big-parallel kvm nixos-test recursive-nix";
  };
}
