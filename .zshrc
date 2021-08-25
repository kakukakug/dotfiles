export LANG=ja_JP.UTF-8

HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space
setopt auto_cd
export BASH_SILENCE_DEPRECATION_WARNING=1

# Git
fpath=(~/.zsh $fpath)
if [ -f ${HOME}/.zsh/git-completion.bash ]; then
  zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fi
autoload -U compinit
compinit -u

if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
  source ${HOME}/.zsh/git-prompt.sh
fi

if type __git_ps1 > /dev/null 2>&1 ; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_SHOWCOLORHINTS=true
  setopt PROMPT_SUBST ; PS1='%F{magenta}%c%f$(__git_ps1 " (%s)") %F{yellow}\$%f '
fi
RPROMPT='%F{cyan}%~%f'

alias be='bundle exec' 

alias ls="ls -GF"
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias @:q="tmux split-window -v \;tmux split-window -h\;tmux resize-pane -D 20\;tmux select-pane -t 0 "
