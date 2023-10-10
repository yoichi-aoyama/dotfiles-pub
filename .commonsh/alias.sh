# lsコマンド
alias e='exa --icons --git'
alias els='e -1g'
alias ell='e -1lg'
alias lslt='e -1lg -snew -r'
alias ls='ls -FG'
alias ll='ls -FG -l'
alias lessn='less -N'
alias h='history -f'
alias hh='history -f 1'
alias .='cd .'
alias ..='cd ..'

# for mac
if [ "$(uname)" == 'Darwin' ]; then
  alias xdg-open='open'
fi

# for linux
if [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    echo ''
fi

#abbr -S ls='exa -FG'
#abbr -S ll='exa -alFG'
#abbr -S lessn='less -N'
#abbr -S h='history -f'
#abbr -S hh='history -f 1'
#
