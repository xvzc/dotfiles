local global = require('global')

local cmp = require'cmp'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    ['<Tab>'] = cmp.mapping(function(fallback)
      if vim.call('UltiSnips#CanJumpForwards') == 1 then
        fallback()
        return
      elseif cmp.visible() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
        return
      else
        fallback()
      end
    end, { 'i' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip', priority = 1}, -- For vsnip users.
    -- { name = 'luasnip', priority = 1 }, -- For ultisnips users.
    { name = 'ultisnips', priority = 1 }, -- For ultisnips users.
    { name = 'path' },
  }, { 
    { name = 'buffer' }, 
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local global = require('global')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, file in ipairs(vim.fn.readdir(global.language_servers_path, [[v:val =~ '\.lua$']])) do
  require('lspconfig')[file:gsub('%.lua$', '')].setup {
    capabilities = capabilities
  }
end
