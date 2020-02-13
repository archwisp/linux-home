" Enable folding of class/function blocks
set foldmethod=syntax

" Set ctags filename
set tags=.javatags

" Re-build ctags file
nnoremap ,t :!ctags --options=$HOME/.vim/ctags-options --languages=Java -f .javatags<CR>
