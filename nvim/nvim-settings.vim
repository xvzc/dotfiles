"set spell spelllang=en_us
filetype indent on

let mapleader=" " "map backslash to leader and will noremap this to <leader>

set undofile
set encoding=utf-8
set fencs=ucs-bom,utf-8,euc-kr.latin1 " euc-kr if Korean, Unicode when unicode 
set tenc=utf-8      " terminal's encoding 

set foldmethod=indent
set foldlevel=99

set ignorecase

set mousehide               " Hide the mouse cursor while typing
set mouse=a                 " Automatically enable mouse usage

set termguicolors
" set notermguicolors
set conceallevel=1
set background=dark

set cindent " C sytle auto indent

set scrolloff=2 
set shiftwidth=4
autocmd FileType vim set shiftwidth=2
autocmd FileType zsh set shiftwidth=2
set expandtab

set tabstop=4

set hlsearch " Search highlight
set history=1000
set updatetime=1000
set shortmess+=c
set number

set undodir=~/.config/nvim/undodir
set nostartofline

"gitgutter sign column
set signcolumn=yes
set pumheight=10

set noshowmode
set showtabline=2

autocmd FileType * set formatoptions-=o " set this line with autocmd to get it applied at runtime
