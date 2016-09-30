#!zsh

DOCKERBREW_ROOT="$0"
[[ $DOCKERBREW_ROOT =~ ^/ ]] ||
  DOCKERBREW_ROOT="$PWD/$DOCKERBREW_ROOT"
export DOCKERBREW_ROOT="$(cd "$(dirname $DOCKERBREW_ROOT)"; pwd)"

echo "dockerbrew: zsh support coming soon"
