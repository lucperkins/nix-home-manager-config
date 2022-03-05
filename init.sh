source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# Run the env.sh script (if it exists). That script is meant to contain secrets, tokens, and
# other things you don't want to put in your Nix config
if [ -e ~/.env.sh ]; then
  . ~/.env.sh
fi

source <(cue completion zsh)

# rbenv setup
eval "$(rbenv init -)"

# Go setup
eval "$(go env)"

# Buf setup
eval "$(buf completion zsh)"

# PATH
export PATH="${GOPATH}/bin":"${PATH}"
export PATH="${HOME}/.cargo/bin":"${PATH}"

bindkey -e
