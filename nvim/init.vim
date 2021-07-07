"set runtimepath+=~/.vim,~/.vim/after
"set packpath+=~/.vim
"source ~/.vimrc


source $DOT_FILES/nvim/vim-plug.vim

" load all plugin custom settings
for f in split(glob('$DOT_FILES/nvim/plugin/*.vim'), '\n')
    exe 'source' f
endfor

source $DOT_FILES/nvim/nvim-settings.vim
source $DOT_FILES/nvim/keymap.vim
source $DOT_FILES/nvim/autocommand.vim

" this line should be at the last line
source $DOT_FILES/nvim/styles.vim

if &term =~ "xterm"
    let &t_ti = "\<Esc>[?47h"
    let &t_te = "\<Esc>[?47l"
endif

