" ==================== Normal Mode

" Move to next/previous buffer
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

" TODO should be moved to a autocmd file for .js files
" Adds JS Function Documentation
nnoremap <leader>d :call JSDocAdd()<CR>

" Quit current buffer
nnoremap <leader>q :q<CR>

" Saves current buffer
nnoremap <leader>s :wa<CR>

" Quit & Save the currenf buffer
nnoremap <leader>a :wq<CR>

" Quit All
nnoremap <leader>x :qa<CR>

" Quit All --force
nnoremap <leader>X :qa!<CR>

" Source VIMRC
nnoremap <leader>rv :source<space>$MYVIMRC<CR>

" Show Git's Blame :: Plugin Related
nnoremap <leader>gb :Gblame<CR>

" Zap trailing whitespace in the current buffer
nnoremap <silent> <leader>zz :call utils#zap()<CR>

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
