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
