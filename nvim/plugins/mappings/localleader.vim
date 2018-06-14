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

" ~/bin/function Snippet
nnoremap <leader>binf :-1read ${HOME}/.config/nvim/snippets/bin-function.sh<CR>2j

" Zap trailing whitespace in the current buffer
nnoremap <silent> <leader>zz :call utils#zap()<CR>

