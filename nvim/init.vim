"set runtimepath+=~/.vim,~/.vim/after
"set packpath+=~/.vim
"source ~/.vimrc

let uname = system('uname -a')
if uname =~ 'Linux'
  echo 'Running on linux ..'
  let g:cur_os='linux'
elseif uname =~ 'WSL'
  echo 'Running on WSL ..'
  let g:cur_os='wsl'
elseif uname =~ 'Darwin'
  echo 'Runing on MacOS ..'
  let g:cur_os='mac'
endif
  
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
