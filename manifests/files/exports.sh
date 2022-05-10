# Make vim the default editor
export EDITOR=$(which nvim)
export TERM="xterm-256color"

if [[ "${SHELL}" =~ "bash" ]]; then
  # Case-insensitive globbing (used in pathname expansion)
  shopt -s nocaseglob

  # Autocorrect typos in path names when using `cd`
  shopt -s cdspell

  # Append to the Bash history file, rather than overwriting it
  shopt -s histappend

  # Enable some Bash 4 features when possible:
  # * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
  # * Recursive globbing, e.g. `echo **/*.txt`
  for option in autocd globstar; do
    shopt -s "$option" 2>/dev/null
  done

  export HSTR_CONFIG=hicolor              # get more colors
  shopt -s histappend                     # append new history items to .bash_history
  export HISTCONTROL=ignoreboth:erasedups # leading space hides commands from history
  export HISTFILESIZE=50000000            # increase history file size (default is 500)
  export HISTSIZE=${HISTFILESIZE}         # increase history size (default is 500)
  # Ensure synchronization between bash memory and history file
  export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
  # If this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
  if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
  # If this is interactive shell, then bind 'kill last command' to Ctrl-x k
  if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
elif [[ "${SHELL}" =~ "zsh" ]]; then
  setopt appendhistory
  setopt sharehistory
  setopt incappendhistory
  setopt correct
  setopt caseglob

  export HSTR_CONFIG=hicolor            # get more colors
  bindkey -s "\C-r" "\C-a hstr -- \C-j" # bind hstr to Ctrl-r (for Vi mode check doc)
fi

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="${yellow}"
export TODOTXT_DEFAULT_ACTION=ls

# HiDPI for GTK Apps
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_DEVICE_PIXEL_RATIO=2

# Set Docker to Allow Untrusted Images
export DOCKER_CONTENT_TRUST=0

# Pulumi/Infra Work Exports
export AWS_SDK_LOAD_CONFIG=1
export PULUMI_SKIP_UPDATE_CHECK=1
