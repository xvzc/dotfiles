if cur_os == "wsl"
  let g:clipboard = {
  \   'name': 'win32yank',
  \   'copy': {
  \      '+': '/usr/local/bin/win32yank.exe -i --crlf',
  \      '*': '/usr/local/bin/win32yank.exe-i --crlf',
  \    },
  \   'paste': {
  \    '+': '/usr/local/bin/win32yank.exe -o --lf',
  \    '*': '/usr/local/bin/win32yank.exe -o --lf',
  \    },
  \   'cache_enabled': 1,
  \ }
endif

if cur_os == "linux"
  let g:clipboard = {
  \   'name': 'xclip-xfce4-clipman',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1,
  \ }
endif

if cur_os == "mac" 
  " Uing OS Clipboard is default on MacOS
  lang en_US " This fixes wrong character issue when pasting Korean from MacOS clipboard
endif

