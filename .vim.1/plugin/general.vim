colorscheme koehler
set guifont=Dina

set nocompatible

filetype plugin indent on
syntax enable

set hlsearch
set number
set nowrap
set textwidth=74
set autoindent

" Dan's mandated tab settings

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Turn off that annoying alert when you hit the end of a line

set visualbell
set t_vb=

" Restores last cusor position when opening a file

if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal g'\"" | endif
endif

" Delete duplicate lines
" nnoremap ,d :g/^\(.*\)\(\r\?\n\1\)\+$/d<CR>

" Insert a new line without entering insert mode

nnoremap ,o :set paste<CR>m`o<Esc>``:set nopaste<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Disable 'bad habbit' keys
" http://blog.sanctum.geek.nz/vim-anti-patterns/

" noremap  <Up> ""
" noremap! <Up> <Esc>
" noremap  <Down> ""
" noremap! <Down> <Esc>
" noremap  <Left> ""
" noremap! <Left> <Esc>
" noremap  <Right> ""
" noremap! <Right> <Esc>

" DBExt defaults

let g:dbext_default_user = $USER
let g:dbext_default_profile_localhost = 'type=MYSQL:host=localhost:port=3306'
let g:dbext_default_profile = 'localhost'
