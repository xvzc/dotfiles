"set runtimepath+=~/.vim,~/.vim/after
"set packpath+=~/.vim
"source ~/.vimrc
let g:cur_os=$CUR_OS

source $DOT_FILES/nvim/vim-plug.vim

source $DOT_FILES/nvim/clipboard.vim
source $DOT_FILES/nvim/nvim-settings.vim
source $DOT_FILES/nvim/keymap.vim
source $DOT_FILES/nvim/autocommand.vim

" this line should be at the last line
source $DOT_FILES/nvim/styles.vim

" load all plugin custom settings
for f in split(glob('$DOT_FILES/nvim/plugin/*.vim'), '\n')
    exe 'source' f
endfor
