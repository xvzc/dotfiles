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

    -- UltiSnips
    'honza/vim-snippets',
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',
  }

  use 'tpope/vim-markdown'

  -- syntax
  use 'octol/vim-cpp-enhanced-highlight'
  use 'othree/yajs.vim' -- js syntax
  use 'HerringtonDarkholme/yats.vim' -- ts
  use 'yuezk/vim-js'
  use 'maxmellon/vim-jsx-pretty'
  use 'fladson/vim-kitty'

  use {
    'junegunn/fzf',  
    requires = { 'junegunn/fzf.vim' }, 
    run = './install --bin' 
  }

  use 'akinsho/toggleterm.nvim'
  use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'godlygeek/tabular'
  use 'scrooloose/nerdcommenter'
  use "iamcco/markdown-preview.nvim"
  use 'farmergreg/vim-lastplace'

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
  use 'junegunn/goyo.vim'
  use'ryanoasis/vim-devicons' -- nerd tree icon
  use 'folke/tokyonight.nvim'
  use 'edeneast/nightfox.nvim'
  -- use 'mhinz/vim-startify' --fancy start screen
  use {'glepnir/dashboard-nvim'}
  use { 'nvim-treesitter/nvim-treesitter', run = ':tsupdate' }
  use "lukas-reineke/indent-blankline.nvim"
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
