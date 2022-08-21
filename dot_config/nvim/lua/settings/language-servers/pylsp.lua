local pylsp_cmd = global.home..'/.local/share/nvim/lsp_servers/pylsp/venv/bin/pylsp'

require'lspconfig'.pylsp.setup{
    on_attach = global.on_attach,
    flags = global.lsp_flags,
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

