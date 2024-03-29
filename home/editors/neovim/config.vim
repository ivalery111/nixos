filetype off

" Leader & Shell
let mapleader=','
set shell=/run/current-system/sw/bin/fish

" Better Unix support
set viewoptions=folds,options,cursor,unix,slash
set encoding=utf-8

" Relative numbers
set relativenumber

" True color support
set termguicolors

" Theme
colorscheme gruvbox-material

" Other options
syntax on
set backspace=2
set laststatus=2
set noshowmode

" Tabs as spaces
set expandtab     " Tab transformed in spaces
set tabstop=4     " Sets tab character to correspond to x columns.
                  " x spaces are automatically converted to <tab>.
                  " If expandtab option is on each <tab> character is converted to x spaces.
set softtabstop=4 " column offset when PRESSING the tab key or the backspace key.
set shiftwidth=4  " column offset when using keys '>' and '<' in normal mode.

" Non-mapped function for tab toggles
function! TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunc

" Clear search highlighting
nnoremap <C-z> :nohlsearch<CR>

" Terminal mode exit shortcut
:tnoremap <Esc> <C-\><C-n>

" Fixes broken cursor on Linux
set guicursor=

" Trim whitespace function
function! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

command! TrimWhitespace call TrimWhitespace() " Trim whitespace with command
autocmd BufWritePre * :call TrimWhitespace()  " Trim whitespace on every save

" General editor options
set hidden                  " Hide files when leaving them.
set number                  " Show line numbers.
set numberwidth=1           " Minimum line number column width.
set cmdheight=2             " Number of screen lines to use for the commandline.
set textwidth=0             " Lines length limit (0 if no limit).
set formatoptions=jtcrq     " Sensible default line auto cutting and formatting.
set linebreak               " Don't cut lines in the middle of a word .
set showmatch               " Shows matching parenthesis.
set matchtime=2             " Time during which the matching parenthesis is shown.
set listchars=tab:▸\ ,eol:¬ " Invisible characters representation when :set list.
set clipboard=unnamedplus   " Copy/Paste to/from clipboard
" set cursorline              " Highlight line cursor is currently on
set completeopt+=noinsert   " Select the first item of popup menu automatically without inserting it

" Search
set incsearch  " Incremental search.
set ignorecase " Case insensitive.
set smartcase  " Case insensitive if no uppercase letter in pattern, case sensitive otherwise.
set nowrapscan " Don't go back to first match after the last match is found.

" Auto-commands Vimscript
augroup vimscript_augroup
  autocmd!
  autocmd FileType vim nnoremap <buffer> <M-z> :execute "help" expand("<cword>")<CR>
augroup END

" Spell check for markdown files
au BufNewFile,BufRead *.md set spell

" Disable the annoying and useless ex-mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" close quickfix window
nnoremap <Esc> :cclose<CR>

" Clear search highlighting
nnoremap <C-z> :nohlsearch<CR>

" Terminal mode exit shortcut
:tnoremap <Esc> <C-\><C-n>

" Incremental substitution
set inccommand=split

" Disable background (let picom manage it)
hi Normal guibg=NONE ctermbg=NONE
