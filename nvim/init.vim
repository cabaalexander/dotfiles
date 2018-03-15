if &compatible
  set nocompatible
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | Od_ | diffthis
    \ | wincmd p | diffthis
endif

" Source plugins Begin
so ~/.config/nvim/plugins/autocmds.vim
so ~/.config/nvim/plugins/settings.vim
so ~/.config/nvim/plugins/macros.vim
so ~/.config/nvim/plugins/pluginmanager.vim
so ~/.config/nvim/plugins/settings-plugin-related.vim
so ~/.config/nvim/plugins/statusline.vim

" Mappings
so ~/.config/nvim/plugins/mappings/leader.vim
so ~/.config/nvim/plugins/mappings/localleader.vim
so ~/.config/nvim/plugins/mappings/normal.vim
so ~/.config/nvim/plugins/mappings/visual.vim

