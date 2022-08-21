-- vim.g.UltiSnipsExpandTrigger = '<Tab>'
-- vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
-- vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
--
vim.g.UltiSnipsExpandTrigger = '<C-F19>'
vim.g.UltiSnipsJumpForwardTrigger = '<C-F19>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-F19>'

-- vim.g.UltiSnipsSnippetsDir = '~/.config/nvim/snippets'
-- vim.g.UltiSnipsSnippetDirectories = {'snippets'}
vim.g.UltiSnipsEnableSnipMate = 1
vim.g.UltiSnipsEditSplit="vertical"

vim.cmd([[
inoremap <silent><expr> <Tab>
\ UltiSnips#CanJumpForwards() ? "\<C-r>=UltiSnips#JumpForwards()\<CR>" :
\ UltiSnips#CanExpandSnippet() ? "\<C-r>=UltiSnips#ExpandSnippet()\<CR>" :
\ "\<Tab>"

snoremap <buffer><silent><nowait> <Tab> <Esc>:call UltiSnips#JumpForwards()<CR>

inoremap <silent><expr> <S-Tab>
\ UltiSnips#CanJumpBackwards() ? "\<C-r>=UltiSnips#JumpBackwards()\<CR>" :
\ "\<C-d>"

snoremap <buffer><silent><nowait> <S-Tab> <Esc>:call UltiSnips#JumpBackwards()<CR>

autocmd! User UltiSnipsEnterFirstSnippet
autocmd User UltiSnipsEnterFirstSnippet lua vim.diagnostic.disable()

autocmd! User UltiSnipsExitLastSnippet
autocmd User UltiSnipsExitLastSnippet lua vim.diagnostic.enable()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

]])
