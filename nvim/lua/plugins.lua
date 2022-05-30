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
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- [[ nvim-cmp setup ]]
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'kyazdani42/nvim-web-devicons'
  use 'tpope/vim-commentary'
  -- use 'sbdchd/neoformat'
  use 'karb94/neoscroll.nvim'
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
  use {
    'folke/trouble.nvim',
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
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
  use 'kyazdani42/nvim-tree.lua'
  -- use {
  --   'ms-jpq/chadtree',
  --   branch = 'chad',
  --   run = 'python3 -m chadtree deps --nvim'
  -- }
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
  use 'sainnhe/sonokai'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

