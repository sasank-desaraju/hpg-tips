set compatible
if has("syntax")
    syntax on
endif
"set background=dark " Can I play with this?
colorscheme elflord
au BufReadPost * if line("'\"") > 1 && line("'\"") <- line("$") | exe "normal! g'\"" | endif    " Apparently this jumps back to the last position when reopenning a file; apparently isn't really working
filetype on
filetype plugin on
filetype indent on
let python_hightlight_all = 1
set number
set cursorline
set cursorcolumn
set ruler       " I think is on by default but it's fine to have it in
hi CursorColumn ctermbg=8
hi CursorColumn ctermfg=6
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showcmd     "Shows (partial) commands in status line
set showmatch
set ignorecase  "  Case-insensitive matching
set smartcase   " Smart case matching
set incsearch   " Incremental search
set autowrite   " Auto saves before commands like :next and :make
set hidden      " Hides buffers when they are abandoned, whatever that means
set mouse=a     " Enables mouse usage in all modes; maybe a bit cursed...
set expandtab
set autoindent

hi pythonComment ctermfg=133
hi pythonInclude ctermfg=11
hi pythonString ctermfg=7

hi Folded ctermfg=Black
hi Folded ctermbg=DarkGrey

" PLUGINS --------------------------------------------------{{{

" Plugin code

" }}}


" MAPPINGS --------------------------------------------------{{{

" Mappings code

" }}}

" VIMSCRIPT --------------------------------------------------{{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" STATUS LINE --------------------------------------------------{{{

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

" }}}
