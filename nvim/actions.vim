" Use clipboard copy if possible.
"if has('clipboard')
  "if has('unnamedplus')  " When possible use + register for copy-paste
    "set clipboard=unnamed,unnamedplus
  "else         " On mac and Windows, use * register for copy-paste
    "set clipboard=unnamed
  "endif
"endif

" Use ctrl - space to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

