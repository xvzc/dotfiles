let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif


colorscheme CandyPaper
" hi Visual term=reverse cterm=reverse guibg=Grey
highlight Visual ctermbg=grey ctermfg=black " set visual mode selection bg-color to grey, fg-color to black

" colorscheme gruvbox

" colorscheme jellybeans
" highlight LineNr ctermfg=grey " set the color of line number to grey

" colorscheme seoul256

"hi Normal guifg=#F8F8F2 guibg=#000000
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

