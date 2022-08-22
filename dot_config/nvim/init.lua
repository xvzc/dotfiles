vim.cmd('filetype plugin indent on')

local global = require('global')

require('plugins')
require('clipboard')
require('preferences')
require('keymaps')
require('styles')

 
for _, name in ipairs(global.find_lua_files(global.language_servers_path)) do
  require('settings.language-servers.' .. name)
end
