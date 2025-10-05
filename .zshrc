# Exit early if shell is non-interactive
[[ $- != *i* ]] && return

#####################################
# 🛠️  Environment
#####################################

# Environment variables

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# export MANPATH="/usr/local/man:$MANPATH"
# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Default editor
export EDITOR='nvim'

# Enable tmux autostart
ZSH_TMUX_AUTOSTART=false

# bun
export BUN_INSTALL="$HOME/.local/share/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"aa:

#####################################
# 📜 History
#####################################

# HIST_STAMPS="mm/dd/yyyy"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase  # Erase duplicates in history

setopt INC_APPEND_HISTORY        # Write history immediately
setopt APPEND_HISTORY            # Append to the history file
setopt SHARE_HISTORY             # Share command history between sessions
setopt HIST_IGNORE_ALL_DUPS      # Don’t record duplicate commands
setopt HIST_SAVE_NO_DUPS         # Don’t save duplicate commands
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS         # Don’t display duplicates during search
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks
setopt HIST_VERIFY

autoload -U history-beginning-search-backward history-beginning-search-forward

bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey -M viins "^P" history-search-backward
bindkey -M viins "^N" history-search-forward

#####################################
# Keybindings
#####################################
if [[ -n "$NVIM" ]]; then
    bindkey -e
else
    bindkey -v
fi

#####################################
# 🔧 Oh My Zsh Core
#####################################

ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Oh My Zsh plugins (core + ones included in OMZ)
plugins=(
  archlinux
  git
  z
  dirhistory
  history
  man
  systemd
  ufw
  tmux
  urltools
  common-aliases
)

source $ZSH/oh-my-zsh.sh

#####################################
# 🔌 Zplug (external plugins)
#####################################

# Initialize zplug
source ~/.zplug/init.zsh

# External plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2   # must load last
zplug "Aloxaf/fzf-tab"
zplug "jeffreytse/zsh-vi-mode", if:"[[ -z $NVIM ]]"

# Install if missing
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load zplug plugins
zplug load

#####################################
# 🛠 Completions
#####################################

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

fpath=(
  ${ASDF_DATA_DIR:-$HOME/.asdf}/completions
  ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-completions/src
  ${ZSH_CUSTOM:-$ZSH/custom}/plugins/tmuxinator/completions
  $fpath
)

autoload -Uz compinit && compinit
eval "$(register-python-argcomplete pipx)"

# bun completions
[ -s "/home/xaron/.local/share/reflex/bun/_bun" ] && source "/home/xaron/.local/share/reflex/bun/_bun"

#####################################
# 🎨 Aliases
#####################################

alias grep='grep --color=auto'

alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vim="nvim"
unalias ls
alias ls="eza"
unalias ll
alias ll="eza -l"
unalias la
alias la="eza -la"

alias ghc="gh copilot suggest"
alias anifetch='python3 ~/Repos/anifetch/anifetch.py --fast-fetch -W 80 -H 40 -f ~/Repos/anifetch/example.mp4 -c "--symbols braille --fg-only"'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#####################################
# 🎭 Prompt & UI
#####################################
# Starship (better prompt, faster than oh-my-zsh themes)
# eval "$(starship init zsh)"

# Layout pl, Swap caps/escape
setxkbmap -layout pl -option caps:swapescape

# Powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#####################################
# 🧰 Tools & Integrations
#####################################
# Fuzzy finder
eval "$(fzf --zsh)"

# Smarter `cd` replacement
eval "$(zoxide init --cmd cd zsh)"


#####################################
# 🛠️  Optional Customization Options
#####################################
# Uncomment the following lines to enable or disable features
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# ZSH_CUSTOM=/path/to/new-custom-folder

fpath+=~/.zfunc; autoload -Uz compinit; compinit
