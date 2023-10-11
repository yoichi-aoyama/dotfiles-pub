#export PATH=/opt/homebrew/bin:$PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# starship
eval "$(starship init zsh)"
# sheldon
eval "$(sheldon source)"

# history
HISTSIZE=20000 # メモリに保存される履歴数
HISTFILE=${HOME}/.zsh_history # 履歴保存先
SAVEHIST=1000000 # 保存履歴件数
setopt hist_ignore_dups # 重複を記録しない
setopt extended_history # 開始と終了を記録
setopt share_history  # historyの共有
# 全履歴表示
function history-all { history -E 1 }
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history

######## END
### zprof
#if (which zprof > /dev/null 2>&1) ;then
#  zprof
#fi
