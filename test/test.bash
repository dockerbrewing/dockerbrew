#!/usr/bin/env bash

set -e

. .rc

run() {
  echo \
================================================================================
  echo "= Run: $*"
  if [[ -n $error ]]; then
    echo Expect an error.
  fi
  echo \
================================================================================
  "$@" || true

  if [[ -n $after ]]; then
    echo "$ $after"
    eval "$after"
  fi

  echo
}

run dockerbrew
# run dockerbrew upgrade
error=1 \
  run dockerbrew bogus
run dockerbrew search cowsay
after='type cowsay' \
  run dockerbrew use cowsay
run dockerbrew install cowsay
run dockerbrew uninstall cowsay
run dockerbrew cmd cowsay Hi
run dockerbrew cmd cowthink Hi
run dockerbrew run cowsay Hi
