#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''

setxkbmap pl

export QT_STYLE_OVERRIDE=kvantum
