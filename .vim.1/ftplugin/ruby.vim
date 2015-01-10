" Enable folding of class/function blocks
set foldmethod=syntax

" Set ctags filename
set tags=.rubytags

" Re-build ctags file
nnoremap ,t :!ctags --options=$HOME/.vim/ctags-options --languages=Ruby -f .rubytags<CR>

" Execute script via CLI
nnoremap ,r :!ruby %<CR>
