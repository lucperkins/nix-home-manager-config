{ pkgs }:

{
  package = pkgs.gitAndTools.gitFull;
  enable = true;
  userName = "Luc Perkins";
  userEmail = "lucperkins@gmail.com";
  ignores = [
    ".cache/"
    ".DS_Store"
    ".idea/"
    "*.swp"
    "built-in-stubs.jar"
    "dumb.rdb"
    ".elixir_ls/"
    ".vscode/"
    "npm-debug.log"
    "shell.nix"
  ];
  aliases = {
    ba = "branch -a";
    bd = "branch -D";
    br = "branch";
    cam = "commit -am";
    co = "checkout";
    cob = "checkout -b";
    ci = "commit";
    cm = "commit -m";
    cp = "commit -p";
    crp = "cherry-pick";
    d = "diff";
    dco = "commit --amend --no-edit --signoff";
    s = "status";
    pr = "pull --rebase";
    st = "status";
    l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
    whoops = "reset --hard";
    wipe = "commit -s";
    fix = "rebase --exec 'git commit --amend --no-edit -S' -i origin/develop";
  };
  extraConfig = {
    core = {
      editor = "nvim";
      whitespace = "trailing-space,space-before-tab";
    };

    commit.gpgsign = "true";
    gpg.program = "gpg2";

    protocol.keybase.allow = "always";
    credential.helper = "osxkeychain";
    pull.rebase = "false";
    init.defaultBranch = "main";

    user = {
      signingkey = "63921327F3433536";
    };
  };
}
