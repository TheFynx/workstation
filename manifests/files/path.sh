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

# Set Rbenv
if [ -d "${HOME}/bin" ]; then
  export RBENV_ROOT="${HOME}/.rbenv"
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

# Add shim/rbenv to path
if [ -n "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

# Set Pyenv
if [ -d "${HOME}/.pyenv" ]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# Add shim/pyenv to path
if [ -n "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# Set Nodenv
if [ -d "${HOME}/.nodenv" ]; then
  export NODENV_ROOT="${HOME}/.nodenv"
  export PATH="${NODENV_ROOT}/bin:${PATH}"
fi

# Add shim/nodenv to path
if [ -n "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
fi

# Set goenv
if [ -d "${HOME}/.goenv" ]; then
  export GOENV_ROOT="${HOME}/.goenv"
  export PATH="${GOENV_ROOT}/bin:${PATH}"
fi
# Add shim/goenv to path
if [ -n "$(command -v goenv)" ]; then
  eval "$(goenv init -)"
fi

# Set GOPATH if it exists
if [ -d "${HOME}/.go" ]; then
  export GOPATH="${HOME}/.go"
fi

# Set GOPATH if it exists
if [ -d "${HOME}/go" ]; then
  export GOPATH="${HOME}/go"
fi

# Add Go Bin to PATH
if [ -d "${GOPATH}/bin" ]; then
  export PATH="${PATH}:${GOPATH}/bin"
fi

# For Travis CLI
[ -f "${HOME}/.travis/travis.sh" ] && source ${HOME}/.travis/travis.sh

export PATH=$PATH:$HOME/.pulumi/bin
