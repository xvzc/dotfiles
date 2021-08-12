" disable search highlight when <esc> pressed
" nnoremap <silent><esc> :let @/=""<cr>:<backspace>
" nmap <silent><esc> :call ESC_ACTION()<CR>

" nohl mapping, don't touch this 
nnoremap <silent><M-C-\> :nohl<CR>
" clear mapping
nnoremap <M-\> <C-l>

" nmap <silent><ESC> :call ESC_ACTION()<CR>
nmap <silent><expr> <esc> v:hlsearch ? 
            \ "\:nohl<CR>" : 
            \"\<esc>"
nmap <silent><C-l> :call CLEAR()<CR>

" new tab
nnoremap <silent><leader>t :tabnew<CR>

" split and move cursor
nnoremap <silent><leader>- :sp<CR><C-w>j
nnoremap <silent><leader>_ :vsp<CR><C-w>l
nnoremap <silent><M-q> :q<CR>
nnoremap <silent><M-w> :w<CR>
nnoremap <silent><M-Q> :q!<CR>

" copy to clip board
nnoremap <leader>yy "+yy
nnoremap <leader>dd "+dd
vnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>p "+p

" indents
" Visual shifting (does not exit Visual mode)
vnoremap <M-h> <gv
vnoremap <M-l> >gv
nnoremap <silent><M-l> :call Indent(1)<cr>
nnoremap <silent><M-h> :call Indent(0)<cr>
inoremap <silent><M-l> <C-o>:call Indent(1)<cr>
inoremap <silent><M-h> <C-o>:call Indent(0)<cr>

" move line
nnoremap <silent><M-k> m`:m--<CR>==``
nnoremap <silent><M-j> m`:m +1<CR>==``

" select all
nnoremap <leader>a gg<S-v><S-g>

func! CLEAR()
    " :let @/=""
    call feedkeys("\<M-C-\>")
    call feedkeys("\<M-\>")
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
