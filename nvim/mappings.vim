"map <F7> <ESC>:set mouse=a<CR>
"map <F8> <ESC>:set mouse-=a<CR>

map <Leader>c<space> <plug>NERDComComment

nmap <leader>t :NERDTreeToggle<CR>
nmap <F1> <nop>

nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap <C-k> m`:m--<CR>==``
nnoremap <C-j> m`:m +1<CR>==``
nnoremap <S-l> $
nnoremap <S-h> ^
nnoremap d<S-l> d$
nnoremap d<S-h> d^

" disable search highlight when <esc> pressed
nnoremap <silent><esc> :let @/ = ""<cr>

vnoremap <S-l> $
vnoremap <S-h> ^

" Visual shifting (does not exit Visual mode)
vnoremap <S-tab> <gv
vnoremap <tab> >gv

"Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
"vnoremap . :normal .<CR>

inoremap jk <esc>
inoremap jj <esc>
inoremap kk <esc>
inoremap kj <esc>

"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" easy motion 
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


inoremap <silent><expr> <S-TAB>
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>" :
      \ <SID>check_back_space() ? "\<C-d>" :
      \ coc#refresh()

inoremap <silent> <CR> <C-r>=<SID>ExpandSnippetOrClosePumOrReturnNewline()<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)


" functions 
"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:ExpandSnippetOrClosePumOrReturnNewline()
    if pumvisible()
        if !empty(v:completed_item)
            return "\<C-y>"
        endif
    else
        return "\<CR>"
    endif
endfunction
