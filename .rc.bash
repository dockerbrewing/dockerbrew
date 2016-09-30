#!bash

DOCKERBREW_ROOT="$BASH_SOURCE"
[[ $DOCKERBREW_ROOT =~ ^/ ]] ||
  DOCKERBREW_ROOT="$PWD/$DOCKERBREW_ROOT"
export DOCKERBREW_ROOT="$(cd "$(dirname $DOCKERBREW_ROOT)"; pwd)"

dockerbrew() {
  local command=
  if command="$($DOCKERBREW_ROOT/bin/dockerbrew eval "$@")"; then
    echo eval "$command"
  else
    "$DOCKERBREW_ROOT/bin/dockerbrew" "$@"
  fi
}

export -f dockerbrew

export MANPATH="$DOCKERBREW_ROOT/man:${MANPATH-}"
# source "$DOCKERBREW_ROOT/share/enable-completion.sh"
