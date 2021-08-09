"let s:clip = '/mnt/c/Windows/System32/clip.exe' 
"if executable(s:clip)
    "augroup WSLYank
        "autocmd!
        "autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    "augroup END
"end

let g:clipboard = {
      \   'name': 'wslclipboard',
      \   'copy': {
      \      '+': '/usr/local/bin/win32yank.exe -i --crlf',
      \      '*': '/usr/local/bin/win32yank.exe-i --crlf',
      \    },
      \   'paste': {
      \      '+': '/usr/local/bin/win32yank.exe -o --lf',
      \      '*': '/usr/local/bin/win32yank.exe -o --lf',
      \   },
      \   'cache_enabled': 1,
      \ }
