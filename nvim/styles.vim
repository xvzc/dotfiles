colorscheme gruvbox

" set visual mode color to grey
highlight visual ctermbg=black ctermfg=grey

"red background issue 
" Use :highlight to see all the settings of highlight
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
" highlight SpellBad term=standout term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
highlight clear Error " red-backgroud 
