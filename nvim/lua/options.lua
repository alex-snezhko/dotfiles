local opt = vim.opt

-- [[ Context ]]
opt.number = true
opt.relativenumber = true                -- bool: Show line numbers
opt.scrolloff = 8                -- int:  Min num lines of context

-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- [[ Theme ]]
-- opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false              -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for
local two_space_indent_langs = {
  "lua",
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  "javascript.jsx",
  "typescript.tsx",
  "css",
  "sass",
  "scss",
  "html",
  "svelte"
}
for _, lang in pairs(two_space_indent_langs) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = lang,
    command = "setlocal shiftwidth=2 softtabstop=2 expandtab"
  })
end

-- [[ Splits ]]
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one

-- [[ Misc ]]
opt.shell = "fish"
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*",
  command = "setlocal formatoptions-=cro"
})

opt.cursorline = true
opt.wrap = false
opt.showmode = false
