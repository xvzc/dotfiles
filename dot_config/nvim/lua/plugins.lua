vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  use {
    'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
    'williamboman/nvim-lsp-installer',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'honza/vim-snippets',
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',
  }

  use 'lewis6991/impatient.nvim'

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
    run = './install --bin' 
  }

  use 'akinsho/toggleterm.nvim'
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
  use 'folke/tokyonight.nvim'
  use 'glepnir/dashboard-nvim'

  use { 
    'nvim-treesitter/nvim-treesitter', 
    run = ':tsupdate' 
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
