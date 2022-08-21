vim.keymap.set('i', '<c-x><c-k>', '<plug>(fzf-complete-word)', { silent = true })
vim.keymap.set('i', '<c-x><c-f>', '<plug>(fzf-complete-path)', { silent = true })
vim.keymap.set('i', '<c-x><c-l>', '<plug>(fzf-complete-line)', { silent = true })

vim.keymap.set('o', '<leader>m', '<plug>(fzf-maps-o)', { silent = true })
vim.keymap.set('n', '<leader>m', '<plug>(fzf-maps-n)', { silent = true })
vim.keymap.set('x', '<leader>m', '<plug>(fzf-maps-x)', { silent = true })

vim.cmd([[

autocmd! FileType fzf set laststatus=0 noshowmode noruler |
      \ autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=? -complete=dir FZF
      \ call fzf#vim#files(<q-args>, 
      \ fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

]])
