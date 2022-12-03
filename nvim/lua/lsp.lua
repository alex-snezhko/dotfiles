-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local setup_lsp_keybinds = require('lua.keybinds').setup_lsp_keybinds

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  setup_lsp_keybinds(client, bufnr)
end

local servers = {
  -- Web dev
  'cssls',
  'cssmodules_ls',
  'tsserver',
  'html',
  'svelte',

  -- Others
  'bashls',
  'sumneko_lua',
  'pyright',
  'ocamllsp',
}

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = servers
})
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
  }
end

