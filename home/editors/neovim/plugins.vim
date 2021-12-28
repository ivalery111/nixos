"
" AIRLINE
"
let g:airline_powerline_fonts=1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

"
" NERDTREE
"
map <C-F> :NERDTreeToggle<CR>
map <C-S> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
filetype plugin on

"
" VIMSPECTOR
"
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

