vim.cmd([[
  function! InstallCocExtentions()
    CocInstall -sync coc-actions coc-browser coc-calc coc-clangd coc-cmake coc-css
    CocInstall -sync coc-explorer coc-fzf-preview coc-git coc-go coc-highlight
    CocInstall -sync coc-html coc-java coc-tsserver coc-json coc-dictionary coc-word
    CocInstall -sync coc-tag coc-lists coc-markdownlint coc-powershell coc-pyright
    CocInstall -sync coc-sh coc-spell-checker coc-sql coc-texlab coc-vimlsp coc-xml
    CocInstall -sync coc-yaml coc-yank coc-diagnostic
  endfunction
]])
