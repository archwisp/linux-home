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
set shiftwidth=3
set softtabstop=3
set tabstop=3

" Turn off that annoying alert when you hit the end of a line

set visualbell
set t_vb=

" Restores last cusor position when opening a file

if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal g'\"" | endif
endif

" Find duplicate lines

nmap <F2> :g/^\(.*\)\(\r\?\n\1\)\+$/d<CR>

" Insert a new line without entering insert mode

nnoremap ,o :set paste<CR>m`o<Esc>``:set nopaste<CR>

" DBExt defaults

let g:dbext_default_user = $USER
let g:dbext_default_profile_localhost = 'type=MYSQL:host=localhost:port=3306'

let g:dbext_default_profile_lasa = 'type=mssql:host=174.129.156.188:port=1433'

let g:dbext_default_profile = 'localhost'
