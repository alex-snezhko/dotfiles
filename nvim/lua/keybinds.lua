local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
map('n', '<leader>p', ":NvimTreeToggle<CR>", opts)

-- Find 'X'
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fs', ':Telescope live_grep<CR>', opts)

-- Buffer-related commands
map('n', '<leader>bb', ':Telescope buffers<CR>', opts)
map('n', '<leader>bh', ':BufferLineCyclePrev<CR>', opts)
map('n', '<leader>bl', ':BufferLineCycleNext<CR>', opts)
map('n', '<leader>bmh', ':BufferLineMovePrev<CR>', opts)
map('n', '<leader>bml', ':BufferLineMoveNext<CR>', opts)
map('n', '<leader>bg', ':BufferLinePick<CR>', opts)
map('n', '<leader>bq', ':BufferLinePickClose<CR>', opts)
for buf_num=1,9 do
  map('n', '<leader>b' .. buf_num, ':BufferLineGoToBuffer ' .. buf_num .. '<CR>', opts)
end

map('n', '<leader>t', ':ToggleTerm<CR>', opts)
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<leader>x', ':TroubleToggle workspace_diagnostics<CR>', opts)
map('n', 'gs', ':HopPattern<CR>', opts)
map('n', 'gw', ':HopWord<CR>', opts)


-- Reselect selection after indentation
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

function _G.set_terminal_keymaps()
  map('t', '<esc>', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

