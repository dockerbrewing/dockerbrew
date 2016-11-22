# The main `dockerbrew` command function:

dockerbrew() {
  local dockerbrew= output= rc=
  dockerbrew=${DOCKERBREW_ROOT:?}/bin/dockerbrew
  rc=0
  output="$($dockerbrew check "$@")" || rc=$?
  if [[ $rc -eq 0 ]]; then
    "$dockerbrew" "$@"
  elif [[ $rc -eq 123 ]]; then
    eval "$output"
  else
    echo "$output"
    return $rc
  fi
}
