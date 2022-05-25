local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- [[ Plugins Go Here ]]
  use 'wbthomason/packer.nvim'
  use {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig'
  }
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use 'RRethy/vim-illuminate'
  use {'akinsho/bufferline.nvim', tag = "v2.*" }
  use {
    'akinsho/toggleterm.nvim',
    tag = 'v1.*',
    config = function()
      require("toggleterm").setup()
    end
  }
  use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    -- requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }
  use 'DanilaMihailov/beacon.nvim'               -- cursor jump
  use {
    'nvim-lualine/lualine.nvim',                     -- statusline
    -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim',                 -- fuzzy finder
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "lukas-reineke/indent-blankline.nvim"
  -- use 'fratajczak/one-monokai-vim'
  use 'sainnhe/sonokai'

  if packer_bootstrap then
    require('packer').sync()
  end
end)