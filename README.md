# Home Manager config

```shell
home-manager switch --flake .
source ~/.zshrc
```

On a fresh machine:

```shell
nix build "github:lucperkins/nix-home-manager-config"
./result/activate
```

