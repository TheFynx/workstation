#!/usr/bin/env bash

# Update path
if [ -d "/usr/share/bcc/tools" ]; then
  export PATH=/usr/share/bcc/tools:${PATH}
fi

# Add local usr bin

if [ -d "/usr/local/bin" ]; then
  export PATH=/usr/local/bin:${PATH}
fi

# Add home local bin
if [ -d "${HOME}/.local/bin" ]; then
  export PATH=${HOME}/.local/bin:${PATH}
fi

# Add Cargo bin
if [ -d "${HOME}/.cargo/bin" ]; then
  export PATH=${HOME}/.cargo/bin:${PATH}
fi

# Include sbin in PATH
if [ -d "/sbin" ]; then
  export PATH="/sbin:${PATH}"
fi

# Include usr sbin
if [ -d "/usr/sbin" ]; then
  export PATH="/usr/sbin:${PATH}"
fi

# ENV Managers
for util in rbenv pyenv nodenv goenv; do
  PATH="$HOME/.$util/bin:$PATH"
  eval "$($util init -)"
done

# For Travis CLI
# shellcheck source=/dev/null
if [ -f "${HOME}/.travis/travis.sh" ]; then
  source "${HOME}/.travis/travis.sh"
fi

if [ -d "$HOME/.pulumi/bin" ]; then
  export PATH=$PATH:$HOME/.pulumi/bin
fi

if [ -d "/usr/sbin" ]; then
  export PATH="/usr/sbin:${PATH}"
fi
