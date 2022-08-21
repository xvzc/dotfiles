vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_keys = 'hklyuiopnm,qwertzxcvbasdgjf;'
vim.g.EasyMotion_smartcase = 1

vim.keymap.set('', '<leader>f', '<Plug>(easymotion-s)', { silent = true })
vim.keymap.set('', '<leader><leader>f', '<Plug>(easymotion-s2)', { silent = true })
