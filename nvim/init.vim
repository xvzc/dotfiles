function! GetNeoVimVersion()
    redir => s
    silent! version
    redir END
    return matchstr(s, 'NVIM v\zs[^\n]*')
endfunction

let g:cur_os=$CUR_OS
  
source $DOT_FILES/nvim/call_plug.vim
source $DOT_FILES/nvim/clipboard.vim
source $DOT_FILES/nvim/neovim_options.vim
source $DOT_FILES/nvim/keymaps.vim
source $DOT_FILES/nvim/autocmds.vim
source $DOT_FILES/nvim/styles.vim " styles.vim should be at the last line

for f in split(glob('$DOT_FILES/nvim/plugin/*.vim'), '\n') " load all plugin settings
    exe 'source' f
endfor
