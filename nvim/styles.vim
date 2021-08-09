let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

"colorscheme jellybeans
colorscheme gruvbox
highlight LineNr ctermfg=grey
"hi Normal guifg=#F8F8F2 guibg=#000000
"hi Normal guifg=NONE guibg=000000 ctermbg=NONE
"set t_ut=""

"red background issue 
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
highlight clear Error
