#!/bin/bash

DOTPATH=~/dotfiles-pub

for f in .??*
do
    # 除外
    [ "$f" = ".DS_Store" ] && continue
    [ "$f" = ".git" ] && continue
    [ "$f" = ".zsh" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

ln -snfv $DOTPATH/.zsh ~/.zsh
#if [ ! -e ~/.config/nvim ];then
#    echo setup neovim
#    mkdir -p ~/.config
#    ln -snfv $DOTPATH/nvim ~/.config/nvim
#fi

mkdir -p ~/tmp/vim_backup
mkdir -p ~/.tmux/resurrect
