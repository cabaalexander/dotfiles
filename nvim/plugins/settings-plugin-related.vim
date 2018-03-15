" Vim Jsx
let g:jsx_ext_required = 0

" IndentLine
let g:indentLine_char = '│'

" Airline
let g:airline#extensions#tabline#enabled = 1

" Anyfold
let anyfold_activate = 1

" Nerdtree
let NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeIgnore=utils#nerdtreeIgnore()

" Emmet
let g:user_emmet_leader_key = '<M-q>'
let g:user_emmet_settings = {
  \   'javascript.jsx': {
  \     'extends' : 'jsx'
  \   }
  \ }

" Needed to cancel CommandT File selection
let g:CommandTCancelMap='<Esc>'

" Awesome vim color scheme
try
  colorscheme gruvbox
  set background=dark
catch
endtry

" Deoplete
let g:deoplete#enable_at_startup = 1

" Deoplete-tern
"let g:deoplete#sources#ternjs#docs = 1 "annoying some times
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'js',
  \ ]

" Ale
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0

