vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap

-- Toggle nvim-tree
map('n', '<leader>p', ":NvimTreeToggle<CR>", { noremap = true })
map('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true })

function _G.set_terminal_keymaps()
  map('t', '<esc>', [[<C-\><C-n>]], { noremap = true })
  map('t', '<C-h>', [[<C-\><C-n><C-W>h]], { noremap = true })
  map('t', '<C-j>', [[<C-\><C-n><C-W>j]], { noremap = true })
  map('t', '<C-k>', [[<C-\><C-n><C-W>k]], { noremap = true })
  map('t', '<C-l>', [[<C-\><C-n><C-W>l]], { noremap = true })
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

require("options")
require("plugins")

require('nvim-tree').setup{}
require('lualine').setup {
  options = {
    -- theme = 'codedark'
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

vim.g.sonokai_style = 'atlantis'
vim.api.nvim_command("colorscheme sonokai")

-- require("nvim-lsp-installer").setup {}

require("indent_blankline").setup {
  char = "▏",
}
require("toggleterm").setup{}
require("bufferline").setup{
  options = {
    mode = "tabs"
  }
}
