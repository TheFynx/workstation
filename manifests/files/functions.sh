#!/usr/bin/env bash

# Cleanup Docker Containers
if [ -n "$(command -v docker)" ]; then
  ## Clean All Non-In Use Docker Items
  dcleanall() {
    docker rm "$(docker ps -aq 2>/dev/null)" 2>/dev/null
    docker rm -v "$(docker ps --filter status=exited -q 2>/dev/null)" 2>/dev/null
    docker rmi "$(docker images --filter dangling=true -q 2>/dev/null)" 2>/dev/null
  }
fi

# Determine size of a file or total size of a directory
fs() {
  if du -b /dev/null >/dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$*" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* ./*
  fi
}

# Run `dig` and display the most useful info
digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
tre() {
  tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

# Get colors in manual pages
man() {
  env \
    LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
    LESS_TERMCAP_md="$(printf "\e[1;31m")" \
    LESS_TERMCAP_me="$(printf "\e[0m")" \
    LESS_TERMCAP_se="$(printf "\e[0m")" \
    LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
    LESS_TERMCAP_ue="$(printf "\e[0m")" \
    LESS_TERMCAP_us="$(printf "\e[1;32m")" \
    man "$@"
}

# Check if uri is up
isup() {
  local uri=$1

  if curl -s --head --request GET "$uri" | grep "200 OK" >/dev/null; then
    notify-send --urgency=critical "$uri is down"
  else
    notify-send --urgency=low "$uri is up"
  fi
}
