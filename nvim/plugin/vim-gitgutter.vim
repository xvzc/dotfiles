let g:gitgutter_map_keys = 0

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-^'
let g:gitgutter_sign_removed_above_and_below = '--'
let g:gitgutter_sign_modified_removed = '*-'

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

highlight link GitGutterChangeLine DiffText

"git gutter sign column 
highlight! link SignColumn LineNr 
