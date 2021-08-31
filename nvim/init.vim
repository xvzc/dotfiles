function! GetNeoVimVersion()
    redir => s
    silent! version
    redir END
    return matchstr(s, 'NVIM v\zs[^\n]*')
endfunction

let g:cur_os=$CUR_OS
  
source $DOT_FILES/nvim/plug.vim
source $DOT_FILES/nvim/clipboard.vim
source $DOT_FILES/nvim/nvim-settings.vim
source $DOT_FILES/nvim/keymap.vim
source $DOT_FILES/nvim/autocommand.vim
source $DOT_FILES/nvim/styles.vim " styles.vim should be at the last line

for f in split(glob('$DOT_FILES/nvim/plugin/*.vim'), '\n') " load all plugin settings
    exe 'source' f
endfor
