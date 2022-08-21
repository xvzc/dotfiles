global = {}

global.autocmd = vim.api.nvim_create_autocmd
global.home = os.getenv('HOME')
global.lsp_config_path = global.home..'/.config/nvim/lua/settings/language-servers'
global.config_path = global.home..'/.config/nvim/lua/settings'
global.language_servers_path = global.config_path..'/language-servers' 

global.syscall = function(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()

  return s
end

global.run_python = function()
  vim.cmd("silent w")
  local cur_buffer = vim.api.nvim_buf_get_name(0)
  local cur_path = vim.fn.getcwd()
  print(global.syscall('python3 '..cur_buffer..' 2>&1'))
end

global.run_cpp = function()
  vim.cmd("silent w")
  local cur_buffer = vim.api.nvim_buf_get_name(0)
  local compile_cmd = 'g++ -std=c++17 -O2 -Wall -Wno-sign-compare -DLOCAL '..cur_buffer..' -o ./a.out 2>&1'
  local compile_out = vim.fn.system(compile_cmd)
  local cur_path = vim.fn.getcwd()

  if vim.api.nvim_get_vvar('shell_error') == 1 then
    print(compile_out)
    return
  end

  print(global.syscall(cur_path..'/a.out'..' 2>&1'))
end

global.run_sh = function()
  vim.cmd("silent w")
  print(vim.fn.system('zsh '..vim.api.nvim_buf_get_name(0)..' 2>&1'))
end

global.map = function(mode, from, handle, options)
  vim.keymap.set(mode, from, handle, options)
end

global.nmap = function(from, handle, options)
  global.map('n', from, handle, options)
end

global.vmap = function (from, handle, options)
  global.map('v', from, handle, options)
end

global.imap = function(from, handle, options)
  global.map('i', from, handle, options)
end

global.smap = function(from, handle, options)
  global.map('s', from, handle, options)
end
