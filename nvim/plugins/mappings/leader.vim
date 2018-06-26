" ==================== Normal Mode

" Move to next/previous buffer
nnoremap <leader>nb :bn<CR>
nnoremap <leader>pb :bp<CR>

" Ale: Move to the next/previous error
nmap <silent> <leader>pe <Plug>(ale_previous_wrap)
nmap <silent> <leader>ne <Plug>(ale_next_wrap)

" Delete current buffer
nnoremap <leader>q :bd<CR>

" Saves current buffer
nnoremap <leader>s :wa<CR>

" Quit & Save the currenf buffer
nnoremap <leader>a :wq<CR>

" Quit All
nnoremap <leader>x :qa<CR>

" Quit All --force
nnoremap <leader>X :qa!<CR>

" Source VIMRC
nnoremap <leader>R :source<space>$MYVIMRC<CR>

" Show Git's Blame :: Plugin Related
nnoremap <leader>gb :Gblame<CR>

" Plugin Manager
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pl :PlugStatus<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>

" Sets the working directory to current buffer
nnoremap <silent> <leader>lcd :call utils#toggleLCD()<CR>

" ==================== Visual Mode

" Sort lines
vnoremap <leader>o :sort<CR>
