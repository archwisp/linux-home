augroup filetypedetect
   au BufNewFile,BufRead *.txt         setf text
augroup END

augroup filetypedetect
   au BufNewFile,BufRead *.adoc         setf adoc
augroup END

augroup filetypedetect
   au BufNewFile,BufRead *.xt  setf xt
augroup END
