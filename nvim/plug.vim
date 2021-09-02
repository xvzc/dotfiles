filetype plugin indent on

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular' " text align plugin
" Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify' " fancy start screen
Plug 'fatih/vim-go', { 'tag': '*'  }
Plug 'ryanoasis/vim-devicons' " Nerd tree icon
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'honza/vim-snippets'
" Plug 'jerry901/vim-snippets'
Plug 'SirVer/ultisnips'
" Plug 'vim-scripts/Vimball'

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

