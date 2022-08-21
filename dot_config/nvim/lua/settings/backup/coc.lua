vim.g.coc_global_extensions = { 
  'coc-snippets', 
  'coc-tsserver', 
  'coc-sh', 
  'coc-json', 
  'coc-go',
  'coc-clangd',
  'coc-ultisnips',
  'coc-snippets',
  'coc-emmet',
}
vim.g.coc_node_path = vim.fn.substitute(vim.fn.system('which node'), '\n', '', '')
vim.g.python3_host_skip_check = 1

vim.g.python3_host_prog = vim.fn.trim(vim.fn.system('which python3'))
vim.g.node_client_debug = 0
-- Use <C-j> for jump to next placeholder, it's default of coc.nvim
vim.g.coc_snippet_next = ''
-- Use <C-k> for jump to previous placeholder, it's default of coc.nvim
vim.g.coc_snippet_prev = ''

vim.g.coc_config_home = '~/.config/nvim/'


autocmd({'CursorHold'}, {
  pattern = '*',
  callback = function()
    vim.cmd([[silent call CocActionAsync('highlight')]])
  end
})

autocmd({'filetype'}, {
  pattern = 'cpp',
  callback = function()
    vim.cmd([[silent call coc#config('clangd.fallbackFlags',['-std=c++17'])]])
  end
})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap('[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
nmap('[g', '<Plug>(coc-diagnostic-next)', { silent = true })
nmap('gd', '<Plug>(coc-definition)', { silent = true })
nmap('gy', '<Plug>(coc-type-definition)', { silent = true })
nmap('gi', '<Plug>(coc-implementation)', { silent = true })
nmap('gr', '<Plug>(coc-references)', { silent = true })
nmap('<leader>i', ':<C-u>CocFzfList<CR>', { silent = true, nowait = true, noremap = true })
nmap('<leader>qf', '<Plug>(coc-fix-current)')
nmap('<leader>rn', '<Plug>(coc-rename)')
nmap('H', ':call CocDocumentation()<CR>', { silent = true })
nmap('<leader>qf', '<Plug>(coc-fix-current)')

if vim.fn.has('nvim') then
  imap('<C-space>', 'coc#refresh()', { silent = true, expr = true })
else
  imap('<C-@>', 'coc#refresh()', { silent = true, expr = true })
end

if cur_os == 'linux' then
  vim.cmd("call add(g:coc_global_extensions, 'coc-imselect')")
end

vim.cmd([[
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<C-f>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<C-b>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

inoremap <silent><nowait><expr> <Tab>
\ coc#pum#visible() ? coc#_select_confirm() :
\ coc#expandableOrJumpable() ?
\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
\ CocCheckBackspace() ? "\<Tab>" :
\ coc#refresh()


inoremap <silent><expr> <S-TAB>
      \ coc#jumpable() ? "\<C-R>=coc#rpc#request('snippetPrev', [])<cr>" :
      \ "\<C-d>"

snoremap <buffer><silent><nowait><TAB> <Esc>:call coc#rpc#request('snippetNext', [])<cr>
snoremap <buffer><silent><nowait><S-TAB> <Esc>:call coc#rpc#request('snippetPrev', [])<cr>

" functions
" tab behavior
function! CocCheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enter key behavior
function s:ExpandSnippetOrClosePumOrReturnNewline()
  if pumvisible()
    if !empty(v:completed_item)
      return "\<C-y>"
    endif
  else
    return "\<CR>"
  endif
endfunction

function! CocDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

]])
