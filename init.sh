# Run the env.sh script (if it exists). That script is meant to contain secrets, tokens, and
# other things you don't want to put in your Nix config
if [ -e ~/.env.sh ]; then
  . ~/.env.sh
fi

eval "$(rbenv init -)"

source <(buf zsh-completion)
