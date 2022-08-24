local global = require('global')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, file in ipairs(vim.fn.readdir(global.language_servers_path, [[v:val =~ '\.lua$']])) do
  require('lspconfig')[file:gsub('%.lua$', '')].setup {
    capabilities = capabilities
  }
end
