vim.cmd('filetype plugin indent on')

require('global')
require('plugins')
require('clipboard')
require('preferences')
require('keymaps')
require('styles')

for _, file in ipairs(vim.fn.readdir(global.config_path, [[v:val =~ '\.lua$']])) do
  require('settings.'..file:gsub('%.lua$', ''))
end

for _, file in ipairs(vim.fn.readdir(global.language_servers_path, [[v:val =~ '\.lua$']])) do
  require('settings.language-servers.'..file:gsub('%.lua$', ''))
end
