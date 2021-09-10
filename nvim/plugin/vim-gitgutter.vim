let g:gitgutter_map_keys = 0

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-^'
let g:gitgutter_sign_removed_above_and_below = '--'
let g:gitgutter_sign_modified_removed = '~-'

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

highlight GitGutterAdd    guifg=#00ff00 ctermfg=10
highlight GitGutterChange guifg=#87afff ctermfg=111
highlight GitGutterDelete guifg=#eb503f ctermfg=167 
highlight GitGutterChangeDelete guifg=#af5fff ctermfg=135

highlight link GitGutterChangeLine DiffText

"git gutter sign column 
highlight! link SignColumn LineNr 
