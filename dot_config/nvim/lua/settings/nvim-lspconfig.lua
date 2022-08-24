local global = require('global')

local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


vim.diagnostic.config({
  float = {
    focusable = false,
    source = 'always',
    border = 'rounded',
    header = '',
    prefix = '',
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  update_in_insert = false,
})


vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

require('settings.language-server-configs')
