require('nvim-tree').setup {
  hijack_cursor = true,
  renderer = {
    indent_width = 1
  },
  actions = {
    open_file = {
      -- quit_on_open = true
    }
  }
}
