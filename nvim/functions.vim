" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" tab behavior
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <S-TAB>
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>" :
      \ <SID>check_back_space() ? "\<C-d>" :
      \ coc#refresh()


" Enter key behavior
function! s:ExpandSnippetOrClosePumOrReturnNewline()
    if pumvisible()
        if !empty(v:completed_item)
            return "\<C-y>"
        endif
    else
        return "\<CR>"
    endif
endfunction
inoremap <silent> <CR> <C-r>=<SID>ExpandSnippetOrClosePumOrReturnNewline()<CR>

