alias sz='source ~/.zshrc'
alias sb='source ~/.bashrc'
alias e='exa --icons --git'
alias ee='e -1lg'
alias els='e -1g'
alias ell='e -1lg'
alias lslt='e -1lg -snew -r'
alias l='ls -FG'
alias ls='ls -FG'
alias ll='ls -FG -l'
alias lessn='less -N'
alias h='history -f'
alias hh='history -f 1'
alias .='cd .'
alias ..='cd ..'
alias cdd='cd ~/dotfiles'
alias cdw='cd ~/work'

alias asdf='mise'
alias rtx='mise'

# for mac
if [ "$(uname)" == 'Darwin' ]; then
  alias xdg-open='open'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  # for linux
  echo ''
fi

#abbr -S ls='exa -FG'
#abbr -S ll='exa -alFG'
#abbr -S lessn='less -N'
#abbr -S h='history -f'
#abbr -S hh='history -f 1'
#
