" Enable folding of class/function blocks
set foldmethod=syntax

" Set ctags filename
set tags=.jstags

" Re-build ctags file
nnoremap ,t :!ctags --options=$HOME/.vim/ctags-options --languages=JavaScript -f .jstags<CR>

" Execute script via CLI
nnoremap ,r :!rhino %<CR>
