#!/bin/bash

DOTPATH=$(cd $(dirname $0) && pwd)

for f in .??*
do
    # 除外
    [ "$f" = ".DS_Store" ] && continue
    [ "$f" = ".git" ] && continue
    [ "$f" = ".zsh" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

ln -snfv $DOTPATH/.zsh ~/.zsh

mkdir -p ~/tmp/vim_backup
mkdir -p ~/.tmux/resurrect
