syntax on
filetype on
filetype plugin on
filetype indent on
set number
set nocursorline
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set history=1000
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi CursorLine term=bold cterm=bold guibg=Grey40
highlight CursorLineNr cterm=none ctermfg=yellow guifg=yellow
augroup CursorLineNrHighlight
	autocmd!
	autocmd WinEnter,BufEnter,FocusGained * setlocal cursorline
	autocmd WinLeave,BufLeave,FocusLost * setlocal nocursorline
augroup END
