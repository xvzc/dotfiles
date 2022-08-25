require('bufferline').setup {
    options = {
    buffer_close_icon = " ",
    modified_icon = "●",
    close_icon = " ",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 20,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = 'thick', -- | "thick" | "thin" | ,
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
  highlights = {
    tab_selected = {
      italic = false
    },
    buffer_selected = {
      italic = false,
    },
  }
}

vim.keymap.set('n', '<leader>1', '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>', {silent = true})
vim.keymap.set('n', '<leader>2', '<cmd>lua require("bufferline").go_to_buffer(2, true)<cr>', {silent = true})
vim.keymap.set('n', '<leader>3', '<cmd>lua require("bufferline").go_to_buffer(3, true)<cr>', {silent = true})
vim.keymap.set('n', '<leader>4', '<cmd>lua require("bufferline").go_to_buffer(4, true)<cr>', {silent = true})
vim.keymap.set('n', '<leader>5', '<cmd>lua require("bufferline").go_to_buffer(6, true)<cr>', {silent = true})
vim.keymap.set('n', '<leader>6', '<cmd>lua require("bufferline").go_to_buffer(7, true)<cr>', {silent = true})
vim.keymap.set('n', '<leader>7', '<cmd>lua require("bufferline").go_to_buffer(8, true)<cr>', {silent = true})
vim.keymap.set('n', '<leader>8', '<cmd>lua require("bufferline").go_to_buffer(9, true)<cr>', {silent = true})
vim.keymap.set('n', '<leader>9', '<cmd>lua require("bufferline").go_to_buffer(10, true)<cr>', {silent = true})
vim.keymap.set('n', '<leader>$', '<cmd>lua require("bufferline").go_to_buffer(-1, true)<cr>', {silent = true})
vim.keymap.set('n', '<leader>^', '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>', {silent = true})
vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', {silent = true})
vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', {silent = true})

vim.keymap.set('n', '<C-w>', ':call CloseBuffer()<CR>', {silent = true})

vim.cmd([[

function CloseBuffer() 
  if winheight(0) + &cmdheight + 2 != &lines
    execute 'clo'
    return
  endif

  if winwidth(0) != &columns
    execute 'clo'
    return
  endif

  execute 'bdelete'
endfunction

]])
