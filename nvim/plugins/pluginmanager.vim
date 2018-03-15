if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  " Editor
  Plug 'pseewald/anyfold'
  Plug 'joom/vim-commentary'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-obsession'
  Plug 'w0rp/ale'
  " Movement / Modes
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'christoomey/vim-tmux-navigator'
  " Text Objects
  Plug 'kana/vim-textobj-user'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'kana/vim-textobj-entire'
  " Autocompletion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'fszymanski/deoplete-emoji'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  " UI
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'tpope/vim-vinegar'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-fugitive'
  " Search
  Plug 'brooth/far.vim'
  Plug 'wincent/scalpel'
  Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
  " Javascript / React
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'styled-components/vim-styled-components'
  Plug 'joegesualdo/jsdoc.vim'
call plug#end()

