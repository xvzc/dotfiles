local packer = require('packer')
packer.reset()

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'
  -- eager load

  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
    'honza/vim-snippets',
    'hrsh7th/cmp-path',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'folke/tokyonight.nvim',
    'hrsh7th/nvim-cmp',
  }

  use {
    'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
    run = ':TSUpdate',
    config = function() require('settings.nvim-lspconfig') end,
  }

  use {
    'hrsh7th/cmp-buffer',
  }


  use {
    'SirVer/ultisnips',
  }

  use {
    'williamboman/nvim-lsp-installer',
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufWinEnter",
    config = function()
      require('settings.treesitter')
    end
  }

  use {
    'akinsho/toggleterm.nvim',
  }

  -- syntax
  use {
    'yuezk/vim-js',
    ft = { 'js' }
  }

  use { -- js syntax
    'othree/yajs.vim',
    ft = { 'js' }
  }

  use { -- ts
    'HerringtonDarkholme/yats.vim',
    ft = { 'js' }
  }

  use { -- jsx
  'maxmellon/vim-jsx-pretty',
    ft = { 'jsx' }
  }

  use {
    'junegunn/fzf',  
    requires = { 'junegunn/fzf.vim' }, 
    run = './install --bin',
  }

  -- use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'godlygeek/tabular'
  use 'scrooloose/nerdcommenter'
  use 'farmergreg/vim-lastplace'
  use {
    'iamcco/markdown-preview.nvim',
    opt = true
  }

  use {
    'akinsho/bufferline.nvim', 
    requires = { 'kyazdani42/nvim-web-devicons' }, 
    tag = 'v2.*'
  }

  use {
    'kyazdani42/nvim-tree.lua', 
    requires = { 'kyazdani42/nvim-web-devicons', }, 
    tag = 'nightly' 
  }

  -- styles
  -- use 'junegunn/goyo.vim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'glepnir/dashboard-nvim'


  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

end)
