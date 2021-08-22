let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf;'
let g:EasyMotion_smartcase = 1

" within line easymotion
map f <Plug>(easymotion-fl)
map F <Plug>(easymotion-Fl)

" <Leader>f{char} to move to {char}
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{}{char} to move to {char}{char}
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f2)

" Move to line
" map <Leader>l <Plug>(easymotion-bd-jk)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
