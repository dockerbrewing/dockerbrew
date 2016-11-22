#!/usr/bin/env bash

set -e

. .rc

run() {
  echo \
================================================================================
  echo "= Run: $*"
  echo \
================================================================================
  "$@"

  if [[ -n $after ]]; then
    echo "$ $after"
    eval "$after"
  fi

  echo
}

run dockerbrew
# run dockerbrew upgrade
run dockerbrew search cowsay
after='type cowsay' \
  run dockerbrew use cowsay
run dockerbrew install cowsay --as=cowtalk
run dockerbrew uninstall cowtalk
run dockerbrew cmd cowsay Hi
run dockerbrew run cowsay Hi
