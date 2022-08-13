#!/usr/bin/env bash

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Shortcuts
alias gc="git commit -v "
alias gsc='git commit -v -S -a -m'
alias gsa='git commit -v -S -a --amend -m'

# Enable color support of ls and also add handy aliases
if [ -x "/usr/bin/dircolors" ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

if [ -n "$(command -v nvim)" ]; then
  alias vcb="nvim +BundleClean! +BundleInstall! +qall!"
  alias v="nvim"
  alias vi="nvim"
  alias vim="nvim"
  alias ni="nvim"
  alias neo="nvim"
fi

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

if [ -n "$(command -v exa)" ]; then
  # switch to exa for better output
  alias ls='exa'

  # List all files colorized in long format w/ git status
  alias ll="ls -lh --git"

  # List all files colorized in long format, including dot files and git status
  alias la="ls -lbah --git"

  # Tree view all files
  alias t="ls -Ta"

  # Tree view only one level deep
  alias t1="ls -Ta -L 1"

  # Tree view two levels deep
  alias t2="ls -Ta -L 2"

  # Tree view three levels deep
  alias t3="ls -Ta -L 3"
else
  # Detect which `ls` flavor is in use
  if ls --color >/dev/null 2>&1; then # GNU `ls`
    colorflag="--color=auto"
  fi
  # List all files colorized in long format
  alias ll="ls -lF ${colorflag}"

  # List all files colorized in long format, including dot files
  alias la="ls -laF ${colorflag}"

  # List only directories
  alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
fi

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# IP addresses
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ips="sudo ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# vhosts
alias hosts='sudo vim /etc/hosts'

# untar
alias untar='tar -xvf'

# Use all cores
alias uac="sh ~/.bin/main/000*"

# Cleanup orphaned packages
alias cleanup='sudo yay -Rns $(yay -Qtdq)'

# Continue download
alias wget="wget -c"

# Get Weather
alias forecast='curl "http://wttr.in/Christian County, MO"'
alias local_forecast='curl http://wttr.in/'

# hh to be alias for hstr
alias hh=hstr
