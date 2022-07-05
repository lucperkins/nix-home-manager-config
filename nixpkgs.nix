{ system }:

{
  config = {
    inherit system;
    allowUnfree = true;
    allowUnsupportedSystem = true;
    sandbox = true;
    experimental-features = "nix-command flakes";
  };
}