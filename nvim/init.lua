vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

require("keybinds").setup()
require("options")
require("plugins")
require("lsp")

require("neoscroll").setup {}
require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt", "vim" }
})
-- require("toggleterm").setup {
--   direction = "float"
-- }

require("config.nvim-treesitter")
require("config.nvim-cmp")
require("config.nvim-tree")
require("config.lualine")

require("indent_blankline").setup {
  char = "▏",
  show_trailing_blankline_indent = false,
  use_treesitter = true
}
-- require("toggleterm").setup {
--   direction = "float"
-- }

-- vim.cmd.colorscheme "one_monokai"
-- vim.cmd.colorscheme "adwaita"
vim.cmd.colorscheme "onedark"

vim.api.nvim_create_autocmd("FileType", {
  pattern = 'go',
  command = "setlocal noexpandtab"
})

vim.api.nvim_create_autocmd("WinEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
