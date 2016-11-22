#!bash

DOCKERBREW_ROOT="$BASH_SOURCE"
[[ $DOCKERBREW_ROOT =~ ^/ ]] ||
  DOCKERBREW_ROOT="$PWD/$DOCKERBREW_ROOT"
DOCKERBREW_ROOT="$(cd "$(dirname $DOCKERBREW_ROOT)"; pwd)"
export DOCKERBREW_ROOT

source "$DOCKERBREW_ROOT/lib/dockerbrew.sh"

export MANPATH="$DOCKERBREW_ROOT/man:$DOCKERBREW_ROOT/usr/man${MANPATH:+:$MANPATH}"
export PATH="$DOCKERBREW_ROOT/usr/bin:$PATH"

# source "$DOCKERBREW_ROOT/share/enable-completion.sh"
