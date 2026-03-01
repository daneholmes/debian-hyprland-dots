# Set path if required

# Aliases
alias cl='clear && ls'
alias dots='cd ~/Repos/dots'
alias lg='lazygit'
alias ls='eza --color=auto'
alias ll='eza -lah --color=auto'
alias grep='grep --color=auto'
alias bluetooth='bluetui'
alias network='impala-nm'
alias shutdown='hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0''
alias reboot='hyprshutdown -t 'Restarting...' --post-cmd 'reboot''

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

setopt histignorealldups sharehistory
setopt autocd

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# zplug - manage plugins
source /usr/share/zplug/init.zsh
zplug "lib/async_prompt", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf"
zplug "themes/simple", from:oh-my-zsh, as:theme   # Theme

# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load
