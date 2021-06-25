"map <F7> <ESC>:set mouse=a<CR>
"map <F8> <ESC>:set mouse-=a<CR>

"map <Leader>c <plug>NERDComComment
"map <Leader>c<space> <plug>NERDComComment

nmap <silent><leader>` :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" MAP
" new tab
nmap <silent><leader>t :tabnew<CR>

" next tab
nnoremap <C-l> gt
" prev tab
nnoremap <C-h> gT

" nmap <F1> <nop>

nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap <C-k> m`:m--<CR>==``
nnoremap <C-j> m`:m +1<CR>==``
nnoremap <S-l> $
nnoremap <S-h> ^
nnoremap d<S-l> d$
nnoremap d<S-h> d^
nnoremap <leader>yy "+yy

" split and move cursor
nnoremap <silent>- :sp<CR><C-w>j
nnoremap <silent>_ :vsp<CR><C-w>l


" disable search highlight when <esc> pressed
nnoremap <silent><esc> :let @/ = ""<cr>

vnoremap <S-l> $
vnoremap <S-h> ^

" Visual shifting (does not exit Visual mode)
vnoremap <S-tab> <gv
vnoremap <tab> >gv

vnoremap <leader>y "+y

"Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
"vnoremap . :normal .<CR>
"
inoremap jk <esc>
inoremap jj <esc>
inoremap kk <esc>
inoremap kj <esc>



"""""""""""""""""""" PLUGIN MAPPINGS """""""""""""""""""""

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
nmap <leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)
