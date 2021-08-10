nnoremap <M-l> <C-l>


" new tab
nnoremap <silent><leader>t :tabnew<CR>

" split and move cursor
nnoremap <silent><leader>- :sp<CR><C-w>j
nnoremap <silent><leader>_ :vsp<CR><C-w>l
nnoremap <silent><C-q> :q<CR>
nnoremap <silent><C-s> :w<CR>

" disable search highlight when <esc> pressed
" nnoremap <silent><esc> :let @/=""<cr>:<backspace>
nmap <silent><esc> :call ESC_ACTION()<CR>

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
vnoremap <C-h> <gv
vnoremap <C-l> >gv
nnoremap <silent><C-l> :call Indent(1)<cr>
nnoremap <silent><C-h> :call Indent(0)<cr>
inoremap <silent><C-l> <C-o>:call Indent(1)<cr>
inoremap <silent><C-h> <C-o>:call Indent(0)<cr>

" move line
nnoremap <silent><C-k> m`:m--<CR>==``
nnoremap <silent><C-j> m`:m +1<CR>==``


" select all
nnoremap <leader>a gg<S-v><S-g>

func! ESC_ACTION()
    :let @/=""
    normal :<backspace>
endfunc

func! Indent(ind)
    if &sol
        set nostartofline
    endif

    let vcol = virtcol('.')
    let cur_line = getline('.')

    let cnt = 0
    for i in range(len(cur_line))
        if cur_line[i] == ' '
            let cnt += 1
        else
            break
        endif
    endfor

    if a:ind
        norm! >>
        exe "norm!". (vcol + shiftwidth()) . '|'
    elseif cnt > 0

        if cnt > shiftwidth()
            norm! <<
            exe "norm!". (vcol - shiftwidth()) . '|'
        else
            norm! <<
            exe "norm!". (vcol - cnt) . '|'
        endif

    endif
endfunc
