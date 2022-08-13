#!/bin/bash
# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f "/etc/bashrc" ]; then
  . /etc/bashrc
fi

if [ -n "$DESKTOP_SESSION" ]; then
  eval "$(gnome-keyring-daemon --start)"
  export SSH_AUTH_SOCK
fi

# Path to the bash it configuration
export BASH_IT="${HOME}/.bash_it"

# Load Bash It
if [ -f "${BASH_IT}/bash_it.sh" ]; then
  # Lock and Load a custom theme file
  # location /.bash_it/themes/
  export BASH_IT_THEME='powerline-multiline'
  export BASH_IT_COMMAND_DURATION=true
  export THEME_CLOCK_FORMAT="%H:%M:%S"
  export POWERLINE_SCM_GIT_CHAR="⎇  "
  export POWERLINE_PROMPT="clock scm python_venv ruby node terraform cwd last_status"
  export POWERLINE_LEFT_PROMPT="clock scm python_venv ruby node terraform cwd"
  export POWERLINE_RIGHT_PROMPT="last_status"

  # Don't check mail when opening terminal.
  unset MAILCHECK

  # Set this to false to turn off version control status checking within the prompt for all themes
  export SCM_CHECK=true

  source ${BASH_IT}/bash_it.sh
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,functions,path,extra,exports}; do
  [[ -r "${file}" ]] && [[ -f "${file}" ]] && source "${file}"
done

unset file
