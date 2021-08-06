au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx
au BufRead,BufNewFile *.nginx set ft=nginx

"autocmd filetype cpp nnoremap <silent><C-M-r> :w <bar> !echo ' '; g++ % -o ./a.out<cr>
autocmd filetype python nnoremap <silent><M-r> :call RUN_PYTHON()<CR>
autocmd filetype cpp nnoremap <silent><M-r> :call RUN_CPP()<CR>

" go to the last position that I was editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

autocmd BufEnter * lcd %:p:h

" functions
function! RUN_PYTHON()
    silent w
    :let output=system('python3 '.expand('%:p'))
    echo ' '
    echo '-------OUTPUT--------'
    echo ' '
    echo output
    echo ' '
endfunction

function! RUN_CPP()
    silent w
    let compile_out=system('g++ '.expand('%:p').' -o ./a.out')
    if v:shell_error != 0
        echo compile_out 
        return
    endif
    let run_out=system(getcwd().expand('/a.out'))
    echo compile_out 
    echo ' '
    echo '-------OUTPUT--------'
    echo ' '
    echo run_out 
    echo ' '
endfunction
