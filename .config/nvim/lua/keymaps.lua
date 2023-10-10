local opts = { noremap = true, silent = true}
-- 入力モード中に素早くjjと入力した場合はESCとみなす
-- inoremap <silent> jj <ESC>
vim.keymap.set("i", "jj", "<ESC>", opts)
--vim.keymap.set('i', 'jj', '<ESC>')
--vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {silent=true})
-- 同上を日本語でも打てるように
-- inoremap <silent> っｊ <ESC>
vim.keymap.set('i', 'っｊ', '<ESC>', opts)

-- 削除キーでヤンクしない
-- nnoremap x "_x
-- nnoremap X "_X
-- nnoremap s "_s
-- "nnoremap d "_d
-- nnoremap D "_D
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "X", '"_X', opts)
vim.keymap.set("n", "s", '"_s', opts)
vim.keymap.set("n", "D", '"_D', opts)
-- vim.api.nvim_set_keymap("n", "x", '"_x', opts) -- 別の書き方


-- 拡張子が.goのファイルに対するキーマッピングを設定
vim.cmd([[
  augroup GoFileMappings
    autocmd!
    autocmd FileType go nnoremap <buffer> <F5> :!go run %<CR>
    autocmd FileType go nnoremap <buffer> <C-i> <Home>i// <Esc>
    autocmd FileType go nnoremap <buffer> <C-f> <Home>"_x"_x<Esc>
  augroup END
]])

vim.cmd([[
  " 新規タブでターミナルモードを起動
  nnoremap <silent> tt <cmd>terminal<CR>
  " 下分割でターミナルモードを起動
  nnoremap <silent> tx <cmd>belowright new<CR><cmd>terminal<CR>
  " ターミナルを開いたらに常にinsertモードに入る
  autocmd TermOpen * :startinsert
  " ターミナルモードで行番号を非表示
  autocmd TermOpen * setlocal norelativenumber
  autocmd TermOpen * setlocal nonumber

  nnoremap <space>e <Cmd>CocCommand explorer<CR>

  nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

  nnoremap <silent> gt <cmd>diffthis<CR>

]])

