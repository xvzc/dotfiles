vim.keymap.set('n', 'ghs', '<Plug>(GitGutterStageHunk)', { silent = true })
vim.keymap.set('n', 'ghu', '<Plug>(GitGutterUndoHunk)', { silent = true })
vim.keymap.set('n', 'ghp', '<Plug>(GitGutterPreviewHunk)', { silent = true })

vim.cmd([[

highlight GitGutterAdd guifg=#00ff00 ctermfg=10
highlight GitGutterChange guifg=#87afff ctermfg=111
highlight GitGutterDelete guifg=#eb503f ctermfg=167 
highlight GitGutterChangeDelete guifg=#af5fff ctermfg=135

highlight link GitGutterChangeLine DiffText

highlight! link SignColumn LineNr 

]])
