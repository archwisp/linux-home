" Enable folding of class/function blocks
let perl_fold = 1

" Set ctags filename
set tags=.perltags

" Re-build ctags file
nnoremap ,t :!ctags --options=$HOME/.vim/ctags-options --languages=Perl -f .perltags<CR>
