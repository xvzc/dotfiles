local global = require('global')

local clangd_cmd = global.home..'/.local/share/nvim/lsp_servers/clangd/clangd/bin/clangd'

require('lspconfig').clangd.setup{
  on_attach = global.on_attach,
  flags = global.lsp_flags,
  filetypes = {"c", "cpp"},
  cmd = { 
    clangd_cmd, 
    '-header-insertion=never',
  },
}
