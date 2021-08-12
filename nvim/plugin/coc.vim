" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<s-tab>'

let g:coc_node_path = substitute(system('which node'), '\n', '', '')
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use ctrl - space to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <c-space> <Plug>(coc-diagnostic-info)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-e>"
  nnoremap <silent><nowait><expr> <C-y> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-y>"
  inoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<C-e>"
  inoremap <silent><nowait><expr> <C-y> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<C-y>"
  vnoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-e>"
  vnoremap <silent><nowait><expr> <C-y> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-y>"
endif

"inoremap <silent><CR> <C-r>=<SID>ExpandSnippetOrClosePumOrReturnNewline()<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>" :
      \ "\<TAB>" 
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

inoremap <silent><expr> <S-TAB>
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>" :
      \ <SID>check_back_space() ? "\<C-d>" :
      \ coc#refresh()

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

