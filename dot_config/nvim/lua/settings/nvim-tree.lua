local global = require('global')

require("nvim-tree").setup({
  open_on_setup = false,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "<ESC>", action = "close_node" },
        { key = "yf", action = "copy" },
        { key = "yn", action = "copy_name" },
        { key = "yp", action = "copy_path" },
        { key = "ya", action = "copy_absolute_path" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})


global.nmap('<leader>e', ':NvimTreeToggle<cr>', { silent = true, noremap = true })
