# neofetch

# Created by `userpath` on 2020-04-18 02:03:19
export PATH="$PATH:/Users/tristenps/.local/bin"
# Default
#export PS1="%n@%m %1~ %# "

# New
#export PS1="%n %1~ → "

# Minimal
#export PS1="%F{blue}%1~%f → "

# Export for Bat theme
export BAT_THEME="dracula"

# Aliases
#alias nv='nvim'
#alias n='nvim'
alias ll='exa -l --icons --sort=type'
alias lla='exa -la --icons --sort=type $argv'
alias cdr='cd $(git rev-parse --show-toplevel)'

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/tristenps/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tristenps/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/tristenps/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tristenps/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/sbin:$PATH"

autoload -Uz vcs_info
precmd() { vcs_info }

#zstyle ':vcs_info:git:*' formats 'on branch %b'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(&b|%a%u$c)'

setopt PROMPT_SUBST
PROMPT='%F{blue}${PWD/#$HOME/~}%f %F{green}${vcs_info_msg_0_}%f > '
