vim.g.mapleader = " "

local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

require("keybinds")
require("options")
require("plugins")
require("lsp")

require("neoscroll").setup {}
require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt", "vim" }
})
require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    -- additional_vim_regex_highlighting = true
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
}
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  }, {
    { name = 'buffer' }
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

require('nvim-tree').setup {
  hijack_cursor = true,
  open_on_setup = true,
  actions = {
    open_file = {
      -- quit_on_open = true
    }
  }
}
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

require("indent_blankline").setup {
  char = "▏",
  show_trailing_blankline_indent = false
}
require("toggleterm").setup {
  direction = "float"
}
-- require("bufferline").setup {
--   options = {
--     show_buffer_close_icons = false,
--     show_close_icon = false,
--     offsets = {
--       {
--         filetype = "NvimTree",
--         text = "File Explorer",
--         text_align = "center"
--       }
--     }
--   }
-- }

vim.g.sonokai_style = 'atlantis'
vim.api.nvim_command("colorscheme sonokai")
vim.api.nvim_command("highlight NvimTreeCursorLine guibg=blue")

local two_space_indent_langs = { "lua", "javascript", "typescript", "javascriptreact", "typescriptreact", "javascript.jsx", "typescript.tsx", "css", "sass", "scss", "html" }
for _, lang in pairs(two_space_indent_langs) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = lang,
    command = "setlocal shiftwidth=2 softtabstop=2 expandtab"
  })
end

-- vim.cmd [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
-- vim.cmd [[autocmd BufEnter * ++nested call timer_start(150, { tid -> execute("if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif") })]]
vim.api.nvim_create_autocmd("WinEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
