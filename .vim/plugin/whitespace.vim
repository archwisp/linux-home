function! ShowWhitespace()
	" show tabs and whitespace at eol
	let b:showWS = 1
	syntax match LineEndWS "\s\+$" containedin=ALL
	" syntax match Tabs "\t" containedin=ALL
	" syntax match LineBeginWS "^\t\{-} " containedin=ALL
	echo "Show Whitespace"
endfunction

function! HideWhitespace()
	" hide tabs and whitespace at eol
	let b:showWS = 0
	syntax clear LineEndWS
	" syntax clear Tabs
	" syntax clear LineBeginWS
	echo "Hide Whitespace"
endfunction

function! ToggleShowWhitespace()
	if !exists('b:showWS')
		let b:showWS = 0
	endif
	" toggle variable
	let b:showWS = !b:showWS
	if b:showWS == 1
		call ShowWhitespace()
	else
		call HideWhitespace()
	endif
endfunction

highlight LineEndWS ctermbg=DarkBlue
" highlight Tabs ctermbg=DarkBlue
" highlight link LineBeginWS Error

nmap ,ws :call ToggleShowWhitespace()<CR>
