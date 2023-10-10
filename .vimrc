augroup vimrc_loadig
    autocmd!
augroup END

syntax on

set list                " 不可視文字の可視化
set listchars=tab:»-,trail:-,nbsp:%,eol:↲
hi NonText    ctermfg=59 guifg=#5f5f5f
hi SpecialKey ctermfg=59 guifg=#5f5f5f

set number              " 行番号の表示
set ruler               " カーソル位置が右下に表示される
set wildmenu            " コマンドライン補完が強力になる
set showcmd             " コマンドを画面の最下部に表示する
set cursorline

set expandtab     " タブの代わりに空白を使う
set tabstop=4     " タブの幅
set shiftwidth=4  " 自動インデントでずれる幅
set shiftround
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅（デフォルトでは無効: 0）
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"hi clear cursorLine
highlight CursorLine cterm=NONE ctermbg=NONE
highlight LineNr ctermfg=245
hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE


set hidden
set showmatch
set matchtime=3

" 対応括弧に'<'と'>'のペアを追加
"set matchpairs& matchpairs+=<:>
" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

""" 検索関係
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト
" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'


" plugin

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mattn/vim-goimports'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" undo永続化
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" backup
set backup
set backupdir=~/tmp/vim_backup

set swapfile
set directory=~/tmp/vim_backup

" クリップボードにヤンクを共有
if has("clipboard")
  set clipboard=unnamed
endif

let g:quickhl_keywords = [
    \ "warn",
    \ "TODO",
    \ "FIXME",
    \ ]

if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

" goの設定
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" 削除キーでヤンクしない
nnoremap x "_x
nnoremap X "_X
nnoremap s "_s
"nnoremap d "_d
nnoremap D "_D

" for Makefile
let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif

inoremap <silent> jj <ESC>

" 削除キーでヤンクしない
nnoremap x "_x
nnoremap X "_X
nnoremap s "_s
"nnoremap d "_d
nnoremap D "_D
