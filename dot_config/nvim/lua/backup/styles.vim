" vim:syntax=vim filetype=vim

set visual mode color to grey

Set backgorund transparent
hi Normal guibg=NONE ctermbg=NONE

" Visual background color

hi CursorLineNR ctermbg=NONE guibg=NONE
hi CursorLine term=none cterm=none ctermbg=none guibg=None

hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

" Red background issue
" Use :highlight to see all the settings of highlight
hi clear SpellBad
hi SpellBad term=standout ctermfg=1 term=underline cterm=underline

" highlight SpellBad term=standout term=underline cterm=underline
hi clear SpellCap
hi SpellCap term=underline cterm=underline

hi clear SpellRare
hi SpellRare term=underline cterm=underline

hi clear SpellLocal
hi SpellLocal term=underline cterm=underline

hi clear Error

hi clear Conceal
hi Conceal ctermfg=66 guifg=#5f8787

hi gruvboxRed guifg=#eb503f

" Search highlight
hi Search cterm=NONE ctermfg=black ctermbg=117 guifg=#0f0f0f guibg=#BBCDEB gui=none
hi IncSearch cterm=NONE ctermfg=black ctermbg=227 guifg=#0f0f0f guibg=#e7f20a gui=none

hi EasyMotionTarget ctermbg=none ctermfg=119 guibg=none guifg=#6FEF78
hi EasyMotionTarget2First ctermbg=none ctermfg=119 guibg=none guifg=#6FEF78
hi EasyMotionTarget2Second ctermbg=none ctermfg=252 guibg=none guifg=#6FEF78
hi EasyMotionShade  ctermbg=none ctermfg=243 guibg=none guifg=#646466

hi Cursor cterm=none gui=none guifg=#646466 ctermfg=black
hi Cursor guifg=#121212 guibg=#afd700

hi SpecialKey guibg=none guifg=#6FEF78
