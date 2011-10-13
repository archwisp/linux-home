pyfile ~/.vim/plugin/debugger.py

nnoremap ,de :python debugger_watch_input("eval")<cr>A
nnoremap ,ds :python debugger_resize()<cr>
nnoremap ,di :python debugger_command('step_into')<cr>
nnoremap ,do :python debugger_command('step_over')<cr>
nnoremap ,dO :python debugger_command('step_out')<cr>
nnoremap ,dc :python debugger_context()<cr>
nnoremap ,dp :python debugger_property()<cr>
nnoremap ,dq :python debugger_quit()<cr>
nnoremap ,dr :python debugger_run()<cr>

"map <F1> :python debugger_resize()<cr>
"map <F2> :python debugger_command('step_into')<cr>
"map <F3> :python debugger_command('step_over')<cr>
"map <F4> :python debugger_command('step_out')<cr>
"map <F5> :python debugger_run()<cr>
"map <F6> :python debugger_quit()<cr>
"map <F11> :python debugger_context()<cr>
"map <F12> :python debugger_property()<cr>
"map <F11> :python debugger_watch_input("context_get")<cr>A<cr>
"map <F12> :python debugger_watch_input("property_get", '<cword>')<cr>A<cr>

hi DbgCurrent term=reverse ctermfg=White ctermbg=Red gui=reverse
hi DbgBreakPt term=reverse ctermfg=White ctermbg=Green gui=reverse

command! -nargs=? Bp python debugger_mark('<args>')
command! -nargs=0 Up python debugger_up()
command! -nargs=0 Dn python debugger_down()
sign define current text=->  texthl=DbgCurrent linehl=DbgCurrent
sign define breakpt text=B>  texthl=DbgBreakPt linehl=DbgBreakPt
python debugger_init(9000, 1)

