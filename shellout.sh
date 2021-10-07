#!/bin/bash

env

INFILE="$1"; shift
OUTFILE="$1"; shift
CMD_CACHE="$OUTFILE.cmd.tmp"
CACHE="$OUTFILE.cache.tmp"

CMD="$@"

same-hash() {
  echo same-hash["$@"]
  echo 1["$1"]
  [[ "$1" = /dev/null ]] || diff -q "$@"
}


use-cache() {
  [[ -r "$CACHE" ]] && \
    [[ -r "$OUTFILE" ]] && \
    [[ -r "$CMD_CACHE" ]] && \
    [[ "$(cat "$CMD_CACHE")" = "$CMD" ]] && \
    same-hash "$INFILE" "$CACHE"
}


if use-cache; then
  echo '(shellout skip)'
else
  echo '============== SHELLOUT ================'
  echo INFILE["$INFILE"]
  echo OUTFILE["$OUTFILE"]
  echo PATH["$PATH"]
  echo WHICH["$(which "$1")"]
  echo VERSION["$(rougify --version)"]
  echo CMD_CACHE["$(cat "$CMD_CACHE")"]

  cat "$INFILE" > "$CACHE"
  echo -n "$@" > "$CMD_CACHE"


  "$@" < "$CACHE" > "$OUTFILE"
fi
