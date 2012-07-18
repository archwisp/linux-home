" Enable folding of class/function blocks
let php_folding = 1

" Do not use short tags to find PHP blocks
" let php_noShortTags = 1

" Highlighti SQL inside PHP strings
" let php_sql_query = 0

" let php_htmlInStrings = 1

" Use PHP syntax check when doing :make
set makeprg=php\ -l\ %

" Execute script via CLI
nnoremap ,r :!php %<CR>

" Perform codecheck
nnoremap ,v :!phpcs %<CR>

" Run unit test
nnoremap ,u :!./bin/runtests %<CR>

" Append template
nnoremap ,b :0r ~/.vim/templates/blank.php<CR>

" Parse PHP error output
set errorformat=%m\ in\ %f\ on\ line\ %l

" Set ctags filename
set tags=.phptags

" Re-build ctags file
nnoremap ,t :!ctags --options=$HOME/.vim/ctags-options --languages=PHP -f .phptags<CR>

highlight OverLength ctermbg=blue ctermfg=white guibg=#592929
" match OverLength /\%80v.\+/

" Function to locate endpoints of a PHP block
function! PhpBlockSelect(mode)
	let motion = "v"
	let line = getline(".")
	let pos = col(".")-1
	let end = col("$")-1

	if a:mode == 1
		if line[pos] == '?' && pos+1 < end && line[pos+1] == '>'
			let motion .= "l"
		elseif line[pos] == '>' && pos > 1 && line[pos-1] == '?'
			" do nothing
		else
			let motion .= "/?>/e\<CR>"
		endif
		let motion .= "o"
		if end > 0
			let motion .= "l"
		endif
		let motion .= "?<\\?php\\>\<CR>"
	else
		if line[pos] == '?' && pos+1 < end && line[pos+1] == '>'
			" do nothing
		elseif line[pos] == '>' && pos > 1 && line[pos-1] == '?'
			let motion .= "h?\\S\<CR>""
		else
			let motion .= "/?>/;?\\S\<CR>"
		endif
		let motion .= "o?<\\?php\\>\<CR>4l/\\S\<CR>"
	endif

	return motion
endfunction
