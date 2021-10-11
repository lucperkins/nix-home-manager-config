export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/bin:/usr/sbin:$PATH
export NIX_PATH=$HOME/.nix-defexpr/channels
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
source $HOME/.nix-profile/etc/profile.d/nix.sh

if [ -e ~/.env.sh ]; then
  . ~/.env.sh
fi