" Enable folding of class/function blocks
set foldmethod=syntax

" Set ctags filename
set tags=.ctags

" Re-build ctags file
nnoremap ,t :!ctags --options=$HOME/.vim/ctags-options --languages=C,C++ -f .ctags<CR>

" set makeprg=gcc\ -g\ -O2\ %\ -o\ %:r
