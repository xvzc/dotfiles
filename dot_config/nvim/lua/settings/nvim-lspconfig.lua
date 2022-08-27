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


-- :help vim.lsp.diagnostic.on_publish_diagnostics
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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

local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    capabilities = capabilities,
    on_attach = on_attach,
    lsp_flags = {
      debounce_text_changes = 150,
    }
  }
end

local lua_settings = {
  settings = {
      Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-----------------------------------------------------------------

local mason = require('mason-registry')
local lspconfig = require('lspconfig')

for _, server in ipairs(mason.get_installed_package_names()) do
  local config = make_config()
  if server == 'pyright' then
    config.filetypes = { 'python', 'py' }
  end

  if server == "lua-language-server" then
    server = 'sumneko_lua'
    config = lua_settings
  end

  if server == "sourcekit" then
    config.filetypes = {"swift", "objective-c", "objective-cpp"};
  end

  if server == "clangd" then
    config.filetypes = {"c", "cpp"}
    config.cmd = {
      'clangd',
      '-header-insertion=never',
    }
  end

  lspconfig[server].setup(config)
end
