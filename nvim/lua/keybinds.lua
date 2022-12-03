local opts = { noremap = true, silent = true }
local map = vim.keymap.set

local function setup_lsp_keybinds(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<leader>=', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local function setup()
  map('n', '<leader>p', ":NvimTreeToggle<CR>", opts)

  -- Find 'X'
  map('n', '<leader>f', ':Telescope find_files<CR>', opts)
  map('n', '<leader>s', ':Telescope live_grep<CR>', opts)
  map('n', '<leader>b', ':Telescope buffers<CR>', opts)

  map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- Faster window movements
  map('n', '<C-h>', '<C-w>h', opts)
  map('n', '<C-j>', '<C-w>j', opts)
  map('n', '<C-k>', '<C-w>k', opts)
  map('n', '<C-l>', '<C-w>l', opts)

  map('n', 'gw', ':HopWord<CR>', opts)

  map('n', '<leader>>', '15<C-w>>', opts)
  map('n', '<leader><', '15<C-w><', opts)

  -- Remove highlight if some text is highlighted
  map('n', '<esc>', ':noh<CR>', { silent = true })

  -- Reselect selection after indentation
  map('v', '<', '<gv', opts)
  map('v', '>', '>gv', opts)

  function _G.set_terminal_keymaps()
    map('t', '<esc>', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
    map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    map('t', '<C-d>', [[<Cmd>wincmd 10l<CR>]], opts)
    map('t', '<C-u>', [[<Cmd>wincmd 10k<CR>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  -- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

return { setup_lsp_keybinds = setup_lsp_keybinds, setup = setup }
