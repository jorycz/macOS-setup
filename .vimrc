autocmd FilterWritePre * if &diff | setlocal wrap< | endif
syntax on
set mouse=
set cursorline
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set autoindent expandtab tabstop=2 shiftwidth=2
:highlight search guifg=yellow guibg=darkred

