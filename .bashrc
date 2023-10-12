echo bash
PS1="\t(\w)>"

if [ "$(uname)" == 'Darwin' ]; then
  if [ "$(uname -m)" = "arm64" ]; then
    OS='ArmMac'
    # curl
    export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"
  else
    OS='IntelMac'
    eval "$(/usr/local/bin/brew shellenv)"
  fi
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

# starship
eval "$(starship init bash)"

n() {
    nvim "$1"
}

fzf_search_history() {
    SELECTED_COMMAND=$(tail ~/.bash_history | tac | fzf --reverse +s )
    if [ "$SELECTED_COMMAND" != "" ]; then
        echo "exec: ${SELECTED_COMMAND}"
        eval $SELECTED_COMMAND
        history -s $SELECTED_COMMAND
    fi
}

alias his="fzf_search_history"
bind -x '"\C-r": fzf_search_history'

function fzf_cd
{
    local found="$( find . -type d | fzf --reverse +s )"
    cd "$found"
}
alias pcc="fzf_cd"
bind -x '"\C-t": fzf_cd'

# コマンド履歴の端末間共有
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -u histappend

# カレントディレクトリの中にあるディレクトリを番号指定で移動するcd listの定義
function cdl {
    local -a dirlist opt_f=false
    local i d num=0 dirnum opt opt_f
    while getopts ":f" opt ; do
        case $opt in
            f ) opt_f=true ;;
        esac
    done
    shift $(( OPTIND -1 ))
    dirlist[0]=..
    for d in * ; do test -d "$d" && dirlist[$((++num))]="$d" ; done
    for i in $( seq 0 $num ) ; do printf "%3d %s%b\n" $i "$( $opt_f && echo -n "$PWD/" )${dirlist[$i]}" ; done
    read -p "select number: " dirnum
    if [ -z "$dirnum" ] ; then
        echo "$FUNCNAME: Abort." 1>&2
    elif ( echo $dirnum | egrep '^[[:digit:]]+$' > /dev/null ) ; then
        cd "${dirlist[$dirnum]}"
    else
        echo "$FUNCNAME: Something wrong." 1>&2
    fi
}

if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# for anyenv
function switch-anyenv {
    eval "$(anyenv init -)"
}

# for asdf
function asdf-enable {
    if [ "$(uname -m)" = "arm64" ]; then
        echo for arm asdf
        . /opt/homebrew/opt/asdf/libexec/asdf.sh
    else
        echo for intel asdf
        . /usr/local/opt/asdf/libexec/asdf.sh
    fi
}

COMMONSHHOME="${HOME}/.commonsh"
source $COMMONSHHOME/alias.sh

