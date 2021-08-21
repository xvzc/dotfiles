let g:coc_global_extensions = [ 'coc-snippets', 
                              \ 'coc-imselect', 
                              \ 'coc-html', 
                              \ 'coc-tsserver', 
                              \ 'coc-sh', 
                              \ 'coc-json', 
                              \ 'coc-go', 
                              \ 'coc-ccls' 
                              \ ]


" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = ''

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = ''

let g:coc_node_path = substitute(system('which node'), '\n', '', '')

let g:python3_host_skip_check = 1
let g:python3_host_prog = trim(system('which python3')) " trim removes new line

let g:node_client_debug = 1

autocmd CursorHold * silent call CocActionAsync('highlight')

" Use ctrl - space to trigger completion.
if has('nvim')
  " coc.nvim trigger option
  if cur_os == 'mac'
    " use <c-space> for trigger completion
    inoremap <silent><expr> <C-space> coc#refresh()
    echo "mac"
  else
    " use <c-space>for trigger completion <c-space> sends <NUL> on wsl
    inoremap <silent><expr> <NUL> coc#refresh()
  endif
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-e>"
  nnoremap <silent><nowait><expr> <C-y> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-y>"
  inoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<C-e>"
  inoremap <silent><nowait><expr> <C-y> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<C-y>"
  vnoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-e>"
  vnoremap <silent><nowait><expr> <C-y> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-y>"
endif


if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" works
inoremap <silent><expr> <Tab>
      \ pumvisible() ? coc#_select_confirm() :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <C-n>
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>" :
      \ "\<C-n>"

inoremap <silent><expr> <S-TAB> <C-d>

inoremap <silent><expr> <C-p>
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>" :
      \ "\<C-n>"
"""

"imap <C-l> <Plug>(coc-snippets-expand)
" \<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
  
inoremap <silent><expr> <Tab>
      \ pumvisible() ? complete_info(['selected'])['selected'] != -1 ?
                     \ "\<C-y>" :
                     \ coc#jumpable() ? "\<C-e>\<C-r>=coc#rpc#request('snippetNext',[])\<CR>" :
                     \ coc#_select_confirm() :
      \ coc#expandable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand',''])\<CR>" :
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" inoremap <silent><expr> <C-n>
" inoremap <silent><expr> <S-TAB> <C-d>
" inoremap <silent><expr> <C-p>

"" functions
" tab behavior
function! s:check_back_space() abort
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
