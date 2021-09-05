colorscheme gruvbox

" set visual mode color to grey
" highlight visual ctermbg=black ctermfg=grey

" Set backgorund transparent
hi Normal guibg=NONE ctermbg=NONE 

" Visual background color
highlight visual ctermfg=grey ctermbg=black guifg=#0F0F0F guibg=#959595 gui=none 

" Red background issue 
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

highlight clear Error 

highlight gruvboxRed guifg=#eb503f

" Search highlight
highlight Search cterm=NONE ctermfg=black ctermbg=117 guifg=#0f0f0f guibg=#BBCDEB gui=none
highlight IncSearch cterm=NONE ctermfg=black ctermbg=227 guifg=#0f0f0f guibg=#e7f20a gui=none

highlight EasyMotionTarget ctermbg=none ctermfg=119 guibg=none guifg=#6FEF78
highlight EasyMotionTarget2First ctermbg=none ctermfg=119 guibg=none guifg=#6FEF78
highlight EasyMotionTarget2Second ctermbg=none ctermfg=252 guibg=none guifg=#6FEF78
highlight EasyMotionShade  ctermbg=none ctermfg=243 guibg=none guifg=#646466

highlight Cursor cterm=none gui=none guifg=#646466 ctermfg=black
highlight SpecialKey guibg=none guifg=#6FEF78

command! -bang -nargs=? -complete=dir HiGroup
      \ echo synIDattr(synID(line("."), col("."), 1), "name")

