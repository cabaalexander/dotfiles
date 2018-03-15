" Edit file, starting in the same directory as current file
nnoremap <localleader>e :edit <C-r>=expand('%:p:h') . '/'<CR>

" Shows the path of the current file
nnoremap <localleader>p :echo expand('%:p')<CR>

" Open last buffer
nnoremap <localleader><localleader> <C-^>

" Toggle linenumbers
nnoremap <localleader>tn :call utils#toggleNumbers()<CR>

" Disables search highlight
nnoremap <localleader>h :noh<CR>

