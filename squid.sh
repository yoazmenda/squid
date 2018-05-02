#!/bin/bash
# ---------------------------------------------------------------------------
# squid.sh - sadsfasdfasdf

# Copyright 2018,  <yoazm@Admins-MBP.Dlink>
# All rights reserved.

# Usage: squid.sh [-h|--help] [-p|--port] [-a|--authentication user]

# Revision history:
# 2018-04-27 Created by script_gen.sh ver. 3.3
# ---------------------------------------------------------------------------

PROGNAME=${0##*/}
VERSION="0.1"

clean_up() { # Perform pre-exit housekeeping
  return
}

error_exit() {
  echo -e "${PROGNAME}: ${1:-"Unknown Error"}" >&2
  clean_up
  exit 1
}

graceful_exit() {
  clean_up
  exit
}

signal_exit() { # Handle trapped signals
  case $1 in
    INT)
      error_exit "Program interrupted by user" ;;
    TERM)
      echo -e "\n$PROGNAME: Program terminated" >&2
      graceful_exit ;;
    *)
      error_exit "$PROGNAME: Terminating on unknown signal" ;;
  esac
}

usage() {
  echo -e "Usage: $PROGNAME [-h|--help] [-p|--port] [-a|--authentication user]"
}

help_message() {
  cat <<- _EOF_
  $PROGNAME ver. $VERSION
  sadsfasdfasdf

  $(usage)

  Options:
  -h, --help  Display this help message and exit.
  -p, --port  squid port
  -a, --authentication user  basic authentication user and password will be used
    Where 'user' is the user name for basic authentication.

_EOF_
  return
}

# Trap signals
trap "signal_exit TERM" TERM HUP
trap "signal_exit INT"  INT



# Parse command-line
while [[ -n $1 ]]; do
  case $1 in
    -h | --help)
      help_message; graceful_exit ;;
    -p | --port)
      echo "squid port" ;;
    -a | --authentication)
      echo "basic authentication user and password will be used"; shift; user="$1" ;;
    -* | --*)
      usage
      error_exit "Unknown option $1" ;;
    *)
      echo "Argument $1 to process..." ;;
  esac
  shift
done

# Main logic

graceful_exit

