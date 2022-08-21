vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 0
vim.g.syntastic_check_on_wq = 0

vim.g.syntastic_python_python_exec = 'python3'
-- let g:syntastic_python_checkers = ['python']

vim.g.syntastic_cpp_compiler = 'g++'
vim.g.syntastic_cpp_compiler_options = ' -std=c++17'

vim.cmd([[
let g:syntastic_mode_map = {'mode': 'passive'}
]])
