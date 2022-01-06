{ pkgs, ... }:

{
  enable = true;

  extensions = with pkgs.vscode-extensions; [
  ];
}
