" new tab
nnoremap <silent><leader>t :tabnew<CR>

" split and move cursor
nnoremap <silent>- :sp<CR><C-w>j
nnoremap <silent>_ :vsp<CR><C-w>l

" disable search highlight when <esc> pressed
nnoremap <silent><esc> :let @/ = ""<cr>

" copy to clip board
nnoremap <leader>yy "+yy
nnoremap <leader>dd "+dd
vnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>p "+p

" insert mode exit
inoremap jk <esc>
inoremap jj <esc>
inoremap kk <esc>
inoremap kj <esc>

" indents
" Visual shifting (does not exit Visual mode)
vnoremap <C-l> <gv
vnoremap <C-h> >gv
nnoremap <silent><C-l> :call Indent(1)<cr>
nnoremap <silent><C-h> :call Indent(0)<cr>
inoremap <silent><C-l> <C-o>:call Indent(1)<cr>
inoremap <silent><C-h> <C-o>:call Indent(0)<cr>

" move line
nnoremap <C-k> m`:m--<CR>==``
nnoremap <C-j> m`:m +1<CR>==``

func! Indent(ind)
  if &sol
    set nostartofline
  endif
  let vcol = virtcol('.')
  if a:ind
    norm! >>
    exe "norm!". (vcol + shiftwidth()) . '|'
  else
    norm! <<
    exe "norm!". (vcol - shiftwidth()) . '|'
  endif
endfunc
