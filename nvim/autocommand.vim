au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx
au BufRead,BufNewFile *.nginx set ft=nginx

autocmd filetype cpp nnoremap <C-M-r> :w <bar> let @+ = expand("%:p")<CR>
autocmd filetype python nnoremap C-M-r> :w <bar> let @+ = expand("%:p")<CR>

" go to the last position that I was editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

autocmd BufEnter * lcd %:p:h
