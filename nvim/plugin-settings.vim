let mapleader=" " "map backslash to leader and will noremap this to <leader>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python3_host_skip_check = 1
"let g:syntastic_python_python_exec = substitute(system('which python3'), '\n', '', '')

let g:javascript_plugin_jsdoc           = 1
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_arrow_function = "⇒"
let g:javascript_conceal_return         = "⇚"

let g:jsx_ext_required = 0

let g:coc_node_path = substitute(system('which node'), '\n', '', '')

let g:airline_theme = 'hybrid'

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1


" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<s-tab>'

