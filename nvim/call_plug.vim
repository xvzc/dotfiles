filetype plugin indent on

call plug#begin()
" Completions
Plug 'neoclide/coc.nvim', {'branch': 'release'} | Plug 'antoinemadec/coc-fzf'
Plug 'honza/vim-snippets' | Plug 'SirVer/ultisnips'

" Extra feature
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify' " fancy start screen
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular' " text align plugin
Plug 'scrooloose/nerdcommenter'

" Language support
Plug 'tpope/vim-markdown'
Plug 'fatih/vim-go', { 'tag': '*'  }

" Styles
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'ryanoasis/vim-devicons' " Nerd tree icon
Plug 'morhetz/gruvbox'

" Plug 'vim-scripts/Vimball'
" Plug 'jerry901/vim-snippets'
" Plug 'scrooloose/nerdtree'
" Plug 'rrethy/vim-illuminate' " hilight matches
" Plug 'tpope/vim-repeat'
" Plug 'rust-lang/rust.vim'
" Plug 'groenewege/vim-less'
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
" Plug 'Shougo/vimproc.vim' " proc syntax
" Plug 'tmhedberg/SimpylFold'
" Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'Shougo/neocomplcache.vim'
" Plug 'vim-scripts/nginx.vim'

call plug#end()
