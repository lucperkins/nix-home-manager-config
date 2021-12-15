#!/bin/bash

# First, move this repo to $HOME/.config/nixpkgs
# git clone https://github.com/lucperkins/nix-home-manager-config ~/.config/nixpkgs

# Install Nix
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon

# Install Home Manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Initiate Home Manager
home-manager switch && source "$HOME/.zshrc"
