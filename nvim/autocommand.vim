au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx
au BufRead,BufNewFile *.nginx set ft=nginx

autocmd filetype cpp nnoremap <silent><C-M-r> :w <bar> !g++ % -o ./a.out; ./a.out<cr>

" go to the last position that I was editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

autocmd BufEnter * lcd %:p:h
