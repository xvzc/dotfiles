local global = require('global')
local cli_capa = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(cli_capa)
local lsp_servers = global.home..'/.local/share/nvim/lsp_servers'
local lspconfig = require('lspconfig')

-- :help vim.lsp.diagnostic.on_publish_diagnostics
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-------------------- C / CPP

local clangd_cmd = lsp_servers..'/clangd/clangd/bin/clangd'
lspconfig.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  filetypes = { 'c', 'cpp' },
  cmd = { 
    clangd_cmd, 
    '-header-insertion=never',
  },
}

-------------------- python

local pylsp_cmd = lsp_servers..'/pylsp/venv/bin/pylsp'
lspconfig.pylsp.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  filetypes = { "python" },
  cmd = { pylsp_cmd },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {
            'W391',
            'E201',
            'E501',
            'E303'
          },
          maxLineLength = 100
        }
      }
    }
  }
}
