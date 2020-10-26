autoload -U compinit
compinit
export LANG=ja_JP.UTF-8

HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space
setopt auto_cd

# Git
fpath=(~/.zsh $fpath)
if [ -f ${HOME}/.zsh/git-completion.zsh ]; then
  zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fi
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

alias cdniji='cd ~/01_dev/02_pp/CFC-App-rn/' 

alias gitcae='git commit --allow-empty -m "wip"'
alias gitlog='git log --oneline --graph'

alias ls="ls -GF"
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

export BASH_SILENCE_DEPRECATION_WARNING=1

#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

#export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
