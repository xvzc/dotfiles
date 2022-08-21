local silent_noremap = {silent = true, noremap = true}
local silent_noremap_expr = {silent = true, noremap = true, expr = true}

global.nmap('<leader>-', ':sp<CR><C-w>j', silent_noremap )
global.nmap('<leader>_', ':vsp<CR><C-w>l', silent_noremap )
 
global.nmap('<leader>y', '"+y', silent_noremap )
global.vmap('<leader>y', '"+y', silent_noremap )

global.nmap('<leader>d', '"+d', silent_noremap )
global.vmap('<leader>d', '"+d', silent_noremap )
global.nmap('<leader>D', '"+D', silent_noremap )

global.nmap('<leader>p', '"+p', silent_noremap )
global.nmap('<F5>', '<C-l>', silent_noremap )
global.nmap('<leader>a', 'gg<S-v><S-g>', silent_noremap )

-- move lines
global.nmap('<C-k>', 'm`:m--<CR>==``', silent_noremap )
global.nmap('<C-j>', 'm`:m +1<CR>==``', silent_noremap )
global.nmap('<C-s>', '<C-w>', silent_noremap )

global.nmap('<esc>', function()
  if vim.api.nvim_get_vvar('hlsearch') == 1 then
    return ":nohl<CR>"
  end

  return "<esc>"
end, silent_noremap_expr)

global.autocmd({'BufRead', 'BufNewFile'}, {
  pattern = '*.cpp', 
  callback = function()
    global.nmap('<C-M-t>', ':0r ~/.templates/ps-template.cpp<CR>', silent_noremap )
  end
})

global.autocmd({'BufRead', 'BufNewFile'}, {
  pattern = '~/*/baekJoon/*.* ', 
  callback = function() 
    global.nmap('<C-M-s>', ':call global.BOJ_SUBMIT()<CR>', silent_noremap )
  end
})

global.autocmd({'filetype'}, {
  pattern = 'python', 
  callback = function() 
    global.nmap('<C-M-r>', ':lua global.run_python()<CR>', silent_noremap )
  end
})

global.autocmd({'filetype'}, {
  pattern = 'cpp', 
  callback = function() 
    global.nmap('<C-M-r>', ':lua global.run_cpp()<CR>', silent_noremap )
  end
})

global.autocmd({'filetype'}, {
  pattern = 'sh', 
  callback = function() 
    global.nmap('<C-M-r>', ':lua global.run_sh()<CR>', silent_noremap )
  end
})


vim.cmd([[

]])
