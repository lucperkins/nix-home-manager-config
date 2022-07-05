{ pkgs }:

{
  enable = true;
  package = pkgs.vscode;
  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
  ];
}
