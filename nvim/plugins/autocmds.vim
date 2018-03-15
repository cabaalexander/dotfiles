"Begin autocommand
augroup vimrcEx
  autocmd!

  " Set limit to 78 characters per line
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the lat known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line ("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

  " When VIM enter
  autocmd VimEnter *
    \ :call utils#obsessed()

  " When you don't press a key for a while
  autocmd CursorHold *
    \ echo ''
augroup END
