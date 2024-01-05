# PATH
unset PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/usr/local/bin:$PATH

export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:~/Library/Android/sdk/platform-tools
export PATH=~/Library/Android/sdk/cmdline-tools/latest/bin:$PATH

# カーソルから先頭まで削除
bindkey \^U backward-kill-line

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# shift-tab で補完逆戻り
bindkey "\e[Z" reverse-menu-complete

# lessコマンド
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS='-R'

## タブ補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# for ruby gem
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

setopt prompt_subst

# alias展開
my-open-alias() {
    if [ -z "$RBUFFER" ] ; then
        my-open-alias-aux
    else
        zle end-of-line
    fi
}

my-open-alias-aux() {
    str=${LBUFFER%% }
    bp=$str
    str=${str##* }
    bp=${bp%%${str}}
    targets=`alias ${str}`
    if [ $targets ]; then
        cmd=`echo $targets|cut -d"=" -f2`
        LBUFFER=$bp${cmd//\'/}
    fi
}

zle -N my-open-alias
bindkey "^ " my-open-alias


############################
# 分割ファイルの読み込み
############################
ZSHHOME="${HOME}/.zsh"
if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

# 単語文字 区切り文字にしたいものはここに記載しない
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>'

findboth () {
    find . -iname "*$1*"
}

grepext () {
     grep -nriI "$1" * .* --exclude-dir=.git --exclude-dir=node_modules --exclude=.flutter-plugins-dependencies --exclude-dir=build --exclude-dir=.dart_tool --exclude-dir=Pods --exclude=.vstags --exclude-dir=backup --exclude-dir=build --exclude-dir=bk --exclude='*.svg' --exclude-dir=tmp --exclude-dir=dist $2 $3 $4 $5
}

grepextsub () {
     grep -nriI "$1" * .* --exclude-dir=.git --exclude-dir=node_modules --exclude=.flutter-plugins-dependencies --exclude-dir=build --exclude-dir=.dart_tool --exclude-dir=Pods --exclude=.vstags --exclude-dir=backup --exclude-dir=build --exclude-dir=bk $2 $3 $4 $5
}

export PATH="/usr/local/sbin:$PATH"
#eval "$(direnv hook zsh)"

export AWS_ASSUME_ROLE_TTL=1h

export PATH="${HOME}/go/bin:$PATH"

export HOMEBREW_NO_INSTALL_CLEANUP=1

clear_docker_logs() {
    echo ":> $(docker inspect ${1} --format '{{.LogPath}}'); exit" | nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock
}
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# anyenv
#if [ -d $HOME/.anyenv ] ; then
#    export PATH="$HOME/.anyenv/bin:$PATH"
#    eval "$(anyenv init -)"
#    if [ -d $HOME/.anyenv/envs/nodenv ] ; then
#        eval "$(nodenv init -)"
#    fi
#
#fi
function switch-anyenv() {
    eval "$(anyenv init -)"
}

# flutter pub global activate junitreport など実行後に有効
export PATH="$PATH":"$HOME/.pub-cache/bin"


# gnu command
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
alias sed='gsed'

# setup fzf
function fzf-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | fzf --reverse +s`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N fzf-history-selection
bindkey '^R' fzf-history-selection


# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
function fzf-cdr () {
    local selected_dir="$(cdr -l | awk '{print $2}' | fzf --reverse +s --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N fzf-cdr
bindkey '^T' fzf-cdr

# for mise
function mise-enable () {
    eval "$(mise activate zsh)"
}
add-zsh-hook chpwd mise-enable

# for neovim
function n {
    nvim "$1"
}

# Golang goroutineオフ
#export GODEBUG=asyncpreemptoff=1

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client@5.7/bin:$PATH"

function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print $1}'| rev)\007"}

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# arm or intel
if [ "$(uname -m)" = "arm64" ]; then
    echo for arm
else
    echo for intel
    export PATH="/usr/local/opt/icu4c/bin:$PATH"
    export PATH="/usr/local/opt/icu4c/sbin:$PATH"
fi

#if [ -f "$HOME/.cargo/env" ]; then
#    source "$HOME/.cargo/env"
#fi

### zcompile
#function source {
#  zcompile $1
#  builtin source $1
#}
#function ensure_zcompiled {
#  local compiled="$1.zwc"
#  if [[ ! -r "$compiled" || "$1" -nt "$compiled" ]]; then
#    echo "Compiling $1"
#    zcompile $1
#  fi
#}
#ensure_zcompiled ~/.zshrc


# 分割ファイル読み込み
COMMONSHHOME="${HOME}/.commonsh"
source $COMMONSHHOME/alias.sh
#if [ -d $COMMONSHHOME -a -r $ZSHHOME -a \
#     -x $COMMONSHHOME ]; then
#    for i in $COMMONSHHOME/*; do
#        [[ ${i##*/} = *.sh ]] &&
#            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
#    done
#fi

export LESS='-R'
if [ "$(uname -m)" = "arm64" ]; then
    export LESSOPEN='|  /opt/homebrew/bin/src-hilite-lesspipe.sh %s'
else
    export LESSOPEN='|  /usr/local/bin/src-hilite-lesspipe.sh %s'
fi

function ghq_cd_repository(){
	local selected_repo="$(ghq list --full-path | fzf +s --query "$LBUFFER")"
	if [ -n "$selected_repo" ]; then
		BUFFER="cd ${selected_repo}"
		zle accept-line
	fi
}
zle -N ghq_cd_repository
bindkey "^G" ghq_cd_repository


# globalias
globalias() {
   # Get last word to the left of the cursor:
   # (z) splits into words using shell parsing
   # (A) makes it an array even if there's only one element
   local word=${${(Az)LBUFFER}[-1]}
   if [[ $GLOBALIAS_FILTER_VALUES[(Ie)$word] -eq 0 ]]; then
      zle _expand_alias
      zle expand-word
   fi
   zle self-insert
}
zle -N globalias

# space expands all aliases, including global
bindkey -M emacs " " globalias
bindkey -M viins " " globalias

# control-space to make a normal space
bindkey -M emacs "^ " magic-space
bindkey -M viins "^ " magic-space

# normal space during searches
bindkey -M isearch " " magic-space
