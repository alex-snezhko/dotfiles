local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
map('n', '<leader>p', ":NvimTreeToggle<CR>", opts)

-- Find 'X'
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fs', ':Telescope live_grep<CR>', opts)

-- Buffer-related commands
map('n', '<leader>b', ':Telescope buffers<CR>', opts)
-- map('n', '<leader>ba', ':Telescope buffers<CR>', opts)
-- map('n', '<leader>bh', ':BufferLineCyclePrev<CR>', opts)
-- map('n', '<leader>bl', ':BufferLineCycleNext<CR>', opts)
-- map('n', '<leader>bmh', ':BufferLineMovePrev<CR>', opts)
-- map('n', '<leader>bml', ':BufferLineMoveNext<CR>', opts)
-- map('n', '<leader>bb', ':BufferLinePick<CR>', opts)
-- map('n', '<leader>bq', ':BufferLinePickClose<CR>', opts)
-- for buf_num=1,9 do
--   map('n', '<leader>b' .. buf_num, ':BufferLineGoToBuffer ' .. buf_num .. '<CR>', opts)
-- end

-- Toggleterm-related commands
map('n', '<leader>tt', ':ToggleTerm<CR>', opts)
for term_num=1,9 do
  map('n', '<leader>t' .. term_num, ':' .. term_num .. 'ToggleTerm<CR>', opts)
end

map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<leader>x', ':TroubleToggle workspace_diagnostics<CR>', opts)
map('n', 'gs', ':HopPattern<CR>', opts)
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
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

