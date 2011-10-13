" General things that should be done at the very end, to override plugin
" settings

" Customize taglist settings
if exists('loaded_taglist')
	let Tlist_Ctags_Cmd = "ctags-exuberant"
	let Tlist_Enable_Fold_Column = 0
	let Tlist_Exit_OnlyWindow = 1
	let Tlist_File_Fold_Auto_Close = 0
	let Tlist_Inc_Winwidth = 1
	let Tlist_Max_Submenu_Items = 15
"	let tlist_php_settings = 'php;c:class;d:constant;f:function'
	let Tlist_WinWidth = 45
	let Tlist_Use_Horiz_Window = 1

	" map <F8> to toggle taglist window
	nmap <silent> <F8> :TlistToggle<CR>
endif

" vim: set fdm=marker:
