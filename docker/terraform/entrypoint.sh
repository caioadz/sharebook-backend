#!/bin/bash

set -e

COMMAND="$1"

case "$COMMAND" in
  *)
    exec terraform $*
    ;;
esac