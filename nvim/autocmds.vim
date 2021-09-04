autocmd BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
autocmd BufRead,BufNewFile */etc/nginx/* set ft=nginx
autocmd BufRead,BufNewFile nginx.conf set ft=nginx
autocmd BufRead,BufNewFile *.nginx set ft=nginx

autocmd BufRead,BufNewFile ~/_jry/algorithms/cpp/*.cpp 
      \ nnoremap <silent><C-M-t> :0r ~/_jry/algorithms/cpp/template.cpp<CR>

autocmd filetype python 
      \ nnoremap <silent><M-C-r> :call RUN_PYTHON()<CR>
autocmd filetype cpp 
      \ nnoremap <silent><M-C-r> :call RUN_CPP()<CR>
autocmd filetype sh 
      \ nnoremap <silent><M-C-r> :call RUN_SHELL()<CR>

" go to the last position that I was editing the file on
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" autocmd BufEnter * lcd %:p:h

" functions
function! RUN_PYTHON()
    silent w
    let output=system('python3 '.expand('%:p'))
    echo ' '
    echo '-------OUTPUT--------'
    echo ' '
    echo output
    echo ' '
endfunction

function! RUN_CPP()
    silent w
    let compile_out=system('g++ -std=c++17 -O2 -Wall -Wno-sign-compare '.expand('%:p').' -o ./a.out')
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
    let run_out=system(expand('rm -rf ').getcwd().expand('/a.out')) " remove out file
endfunction

function! RUN_SHELL()
    silent w
    let output=system('zsh '.expand('%:p'))
    echo ' '
    echo '-------OUTPUT--------'
    echo ' '
    echo output
    echo ' '
endfunction
