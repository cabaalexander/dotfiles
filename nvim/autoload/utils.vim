function! utils#zap() abort
  " Zap trailing whitespace
  let l:pos=getcurpos()
  let l:search=@/
  keepjumps %substitute/\s\+$//e
  nohlsearch
  call setpos('.', l:pos)
endfunction

function! utils#obsessed() abort
  " Tries to and creates a session
  if exists(':Obsession') < 1
    echom "Obsession plugin not installed"
    return 1
  endif

  let l:status = ObsessionStatus()
  let l:session = filereadable('Session.vim')

  if !l:session || l:status == '[S]'
    execute('Obsession')
  elseif l:status == '[$]'
    echom "You're Obsessed"
  elseif l:session && strlen(l:status) == 0
    echom "You have a session file, to restore it run: nvim -S"
  endif
endfunction

function! utils#toggleNumbers() abort
  " Hides or shows line numbers
  if &nu > 0
    set nu!
  else
    set nu
  endif

  if &relativenumber > 0
    set relativenumber!
  else
    set relativenumber
  endif
endfunction

function! utils#toggleLCD() abort
  " Change the LCD between root and current buffer
  if get(b:, 'initialLCD') == '0'
    let b:initialLCD=getcwd()
  endif

  if !get(b:, 'toggleLCDBool')
    let b:path=expand("%:p:h")
    let b:toggleLCDBool=1 " toggle true
  else
    let b:path=b:initialLCD
    let b:toggleLCDBool=0 " toggle false
  endif

  execute("lcd " . b:path)
  echom "LCD changed to: " . b:path
endfunction

function! utils#escapeSnake(char) abort
  " Escapes snake character (~) to be used on regex
  if a:char == "~"
    return "\\" . a:char
  else
    return a:char
  endif
endfunction

function! utils#globToRegex(glob) abort
  " Conver end of string glob pattern to regex
  if a:glob !~ "^[*]"
    return a:glob
  endif
  let l:regex=strcharpart(a:glob, 1)
  let l:regex=split(l:regex, '\zs')
  let l:regex=map(copy(l:regex), {idx, val -> utils#escapeSnake(val)})
  let l:regex=join(l:regex, '')

  return '\' . l:regex . "$"
endfunction

function! utils#nerdtreeIgnore() abort
  " Returns a list elements in the .gitignore_global file
  let l:homePrefix=expand('~') . "/"
  let l:lines=readfile(l:homePrefix . ".gitignore_global")
  let l:lines=filter(copy(l:lines), {idx, val -> strlen(val) && val !~ "^#"})
  let l:lines=map(copy(l:lines), {idx, val -> utils#globToRegex(val)})

  return l:lines
endfunction
