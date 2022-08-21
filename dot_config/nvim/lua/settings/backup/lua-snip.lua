require("luasnip.loaders.from_snipmate").lazy_load({ 
  paths = { global.home..'/.config/nvim/snippets' } 
})

local ls = require('luasnip')
ls.config.set_config({
	-- region_check_events = "InsertEnter, InsertLeave",
  region_check_events = "CursorMoved",
	-- delete_check_events = "TextChanged",
})

vim.cmd([[
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? "\<C-r>\luasnip-expand-or-jump()<CR>" : "\<Tab>" 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
]])

local luasnip = require "luasnip"
local augroup = vim.api.nvim_create_augroup("luasnip-expand", { clear=true })

vim.api.nvim_create_autocmd("ModeChanged", {
  group    = augroup,
  pattern  = "*:s",
  callback = function ()
    if luasnip.in_snippet() then
      return vim.diagnostic.disable()
    end
  end
})

vim.api.nvim_create_autocmd("ModeChanged", {
  group    = augroup,
  pattern  = "[is]:n",
  callback = function ()
    if luasnip.in_snippet() then
      return vim.diagnostic.enable()
    end
  end
})
