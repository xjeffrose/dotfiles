
#==== .zshrc ====
#-------------------------------------------------------------------------#
# File:     .zshrc   ZSH resource file                                    #
# Version:  0.1.0                                                         #
# Author:  Jeff Rose                                                      #
#-------------------------------------------------------------------------#

#------------------------------
# Variables
#------------------------------
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=
export GOPATH=$HOME/workspace/go
export PATH=$PATH:/usr/local/bin:$HOME/bin:$GOPATH/bin
export EDITOR=vim
export PAGER=less
export LESS=-iMX
export LESS_TERMCAP_mb=$'\e[01;37m'
export LESS_TERMCAP_md=$'\e[01;37m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[07;37m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;36m'
export GREP_COLOR="1;33"
export HISTFILE="$HOME/.bash_history_`hostname`"   # hostname appended to bash history filename
export HISTSIZE=10000                              # bash history will save N commands
export HISTFILESIZE=${HISTSIZE}                    # bash will remember N commands
export HISTCONTROL=ignoreboth                      # ingore duplicates and spaces (ignoreboth, ignoredups, ignorespace)
# don't append the following to history: consecutive duplicate
# commands, ls, bg and fg, and exit
HISTIGNORE='\&:fg:bg:ls:pwd:cd ..:cd ~-:cd -:cd:jobs:set -x:ls -l:ls -l'
HISTIGNORE=${HISTIGNORE}':%1:%2:shutdown*'
export HISTIGNORE

#-----------------------------
# Dircolors
#-----------------------------
export CLICOLOR=1
export LSCOLORS=gxGxFxdxbxDxDxBxBxExEx
#------------------------------
# Keybindings
#------------------------------
bindkey -v
typeset -g -A key
#bindkey '\e[3~' delete-char
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
#bindkey '\e[2~' overwrite-mode
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char
# for gnome-terminal
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

#------------------------------
# Alias stuff
#------------------------------
alias mvim="open macvim"
alias df="gdf -hT"
alias more='less'
alias mkdir='mkdir -p -v'
alias rmdir="rm -rf"
alias ..='cd ..'
alias b="cd -"
alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='gdu --max-depth=1'
alias hist='history | grep $1'               # requires an argument
alias openports='netstat --all --numeric --programs --inet'
alias getip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias du="gdu -idh"
alias dus="gdu -isdh"
alias qq="exit"
alias sudo="sudo "
alias sudp="sudo "
alias reboot="sudo /sbin/shutdown -r now"
alias shutdown="sudo /sbin/shutdown -h now"
alias vt="vim ~/todo"
alias ducks='gdu -cks * |sort -rn |head -11'  # disk hog
alias c='clear'                              # clear screen
alias sv='sudo vim'                          # lazy

# ls
alias ls='gls -GpFh --color'
alias lr='ls -R'                             # recursive ls
alias lx='ll -BX'                            # sort by extension
alias lz='ll -rS'                            # sort by size
alias lt='ll -rt'                            # sort by date
alias ll='ls -lh'                            # list detailed with human-readable sizes
alias la='ls -a'                             # list all files
alias dir='ls -1'                            # windows-style list
alias lm='la | more'
alias lal="ls -Al"
alias lh="ls -Alh"
alias lS="ls -lS"
alias lSr="ls -lSr"
alias lt="ls -lt"
alias ltr="ls -ltr"
alias lX="ls -lX"

#grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias g="egrep"
alias f='find | grep'                        # quick search

#ps
alias psh="ps -u `whoami` -U `whoami` -o user,pid,pcpu,pmem,stat,start_time,comm -H"
alias psp="ps -u `whoami` -U `whoami` -o user,pid,pcpu,pmem,stat,start_time,comm --sort pcpu"
alias sps='ps aux | grep -v grep | grep'     # search process
alias psm="echo '%CPU %MEM   PID COMMAND' && ps hgaxo %cpu,%mem,pid,comm | sort -nrk1 | head -n 10 | sed -e 's/-bin//' | sed -e 's/-media-play//'"

#kill zombies
alias killzombies=echo -e "ps -ef | grep defunct | awk '{ print $3 }' | xargs kill -9"

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

#Mac Stuff

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias port='/opt/local/bin/port'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# mktar - tarball wrapper
# usage: mktar <filename | dirname>
function mktar() { tar czf "${1%%/}.tar.gz" "${1%%/}/"; }


# mkmine - recursively change ownership to $USER:$USER
# usage:  mkmine, or
#         mkmine <filename | dirname>
function mkmine() { sudo chown -R ${USER}:${USER} ${1:-.}; }

# sanitize - set file/directory owner and permissions to normal values (644/755)
# usage: sanitize <file>
sanitize()
{
  chmod -R u=rwX,go=rX "$@"
  chown -R ${USER}:users "$@"
}


#------------------------------
# Comp stuff
#------------------------------
zmodload zsh/complist
autoload -Uz compinit
compinit
zstyle :compinstall filename '/home/jrose/.zshrc'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

#------------------------------
# Window title
#------------------------------
case $TERM in
    *xterm*|rxvt|rxvt-unicode|rxvt-256color|(dt|k|E)term)
        precmd () { print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a" }
        preexec () { print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a" }
    ;;
    screen)
        precmd () {
            print -Pn "\e]83;title \"$1\"\a"
            print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a"
        }
        preexec () {
            print -Pn "\e]83;title \"$1\"\a"
            print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a"
        }
    ;;
esac

#------------------------------
# Prompt
#------------------------------
setprompt () {
    # load some modules
    autoload -U colors zsh/terminfo # Used in the colour alias below
    colors
    setopt prompt_subst

    # make some aliases for the colours: (coud use normal escap.seq's too)
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
        eval PR_$color='%{$fg[${(L)color}]%}'
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"

    # Check the UID
    if [[ $UID -ge 1000 ]]; then # normal user
        eval PR_USER='${PR_GREEN}%n${PR_NO_COLOR}'
        eval PR_USER_OP='${PR_GREEN}%#${PR_NO_COLOR}'
    elif [[ $UID -eq 0 ]]; then # root
        eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
        eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
    fi

    # Check if we are on SSH or not  --{FIXME}--  always goes to |no SSH|
    if [[ -z "$SSH_CLIENT"  ||  -z "$SSH2_CLIENT" ]]; then
        eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
    else
        eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
    fi
    # set the prompt
    PS1=$'${PR_CYAN}[${PR_USER}${PR_CYAN}@${PR_HOST}${PR_CYAN}][${PR_MAGENTA}%~${PR_CYAN}]${PR_USER_OP}${PR_YELLOW}$(__git_ps1 "[%s]")'
    PS2=$'%_>'
}
setprompt

source ~/.live-command-coloring.sh
source ~/.git-completion.bash
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
source ~/.virtual_envs/system/bin/activate
source ~/.rvm/scripts/rvm
