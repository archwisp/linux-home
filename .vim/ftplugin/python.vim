" Set ctags filename
set tags=.pytags

" Execute script via CLI
nnoremap ,r :!python %<CR>

" Re-build ctags file
nnoremap ,t :!ctags --options=$HOME/.vim/ctags-options --languages=Python -f .pytags<CR>

" Python tab settings

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
