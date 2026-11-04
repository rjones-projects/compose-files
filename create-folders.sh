#!/usr/bin/env bash
# Creates every volume folder listed in volumes.yaml under ~/docker (or the root given as $1).
set -euo pipefail
root="${1:-$HOME/docker}"
case "$root" in -*) echo "usage: $0 [root-folder]   (default: ~/docker, no options)" >&2; exit 1 ;; esac
grep -E '^\s+device: /home/roland/docker/' "$(dirname "$0")/volumes.yaml" | tr -d '\r' | sed 's#.*/home/roland/docker/##' |
  while read -r dir; do
    mkdir -p "$root/$dir"
    echo "$root/$dir"
  done
