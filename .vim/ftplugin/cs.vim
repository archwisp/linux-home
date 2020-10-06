" Enable folding of class/function blocks
set foldmethod=syntax

" Set ctags filename
set tags=.cstags

" Re-build ctags file
nnoremap ,t :!ctags --options=$HOME/.vim/ctags-options --languages=C\# -f .cstags<CR>

" set makeprg=gcc\ %\ -o\ %:r
" set makeprg=gcc\ -g\ -O2\ %\ -o\ %:r
" set makeprg=gcc\ -ggdb\ %\ -o\ %:r
