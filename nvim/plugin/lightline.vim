let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [] ] }

let s:palette = g:lightline#colorscheme#gruvbox#palette

" let s:palette.tabline.tabsel = [ [ '#292E32', '#8CB270', 252, 66, 'bold' ] ]
" let s:palette.tabline.tabsel = [ [ '#3F403F', '#7FB6DD', 252, 66, 'bold' ] ]

let s:palette.tabline.middle = s:palette.normal.middle

unlet s:palette
