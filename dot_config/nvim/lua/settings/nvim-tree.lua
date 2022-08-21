require("nvim-tree").setup({
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


vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', { silent = true })
