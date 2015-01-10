nnoremap ,b :!asciidoc -d book %<CR>
nnoremap ,m :!asciidoc -a asciimath %<CR>
nnoremap ,p :!a2x -fpdf -dbook %<CR>
nnoremap ,s :!aspell -c %<CR>

" Spell checking 
setlocal spell spelllang=en_us

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
