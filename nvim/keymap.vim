" new tab
nnoremap <silent><leader>t :tabnew<CR>

" split and move cursor
nnoremap <silent><leader>- :sp<CR><C-w>j
nnoremap <silent><leader>_ :vsp<CR><C-w>l
nnoremap <silent><C-q> :q<CR>
nnoremap <silent><C-s> :w<CR>

" disable search highlight when <esc> pressed
nnoremap <silent><esc> :let @/ = ""<cr>

" copy to clip board
nnoremap <leader>yy "+yy
nnoremap <leader>dd "+dd
vnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>p "+p
nnoremap <leader>a gg<S-v>G

" indents
" Visual shifting (does not exit Visual mode)
vnoremap <C-h> <gv
vnoremap <C-l> >gv
nnoremap <silent><C-l> :call Indent(1)<cr>
nnoremap <silent><C-h> :call Indent(0)<cr>
inoremap <silent><C-l> <C-o>:call Indent(1)<cr>
inoremap <silent><C-h> <C-o>:call Indent(0)<cr>

" move line
nnoremap <C-k> m`:m--<CR>==``
nnoremap <C-j> m`:m +1<CR>==``

" cat 
nnoremap <silent><C-M-e> :!cat %<cr>

func! ESC_ACTION()
    :let @/=""
    normal :<esc>
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
    else
        if cnt == 0
            return
        endif

        if cnt > shiftwidth()
            norm! <<
            exe "norm!". (vcol - shiftwidth()) . '|'
        else
            norm! <<
            exe "norm!". (vcol - cnt) . '|'
        endif
    endif
endfunc

