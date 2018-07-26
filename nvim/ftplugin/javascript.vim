" Only do this when not done yet for this buffer
if exists("b:did_ftplugin_javascript")
  finish
endif
let b:did_ftplugin_javascript=1

" Add documentation to a function
nnoremap <buffer> <leader>d :call JSDocAdd()<CR>

