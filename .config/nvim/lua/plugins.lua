

return require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use {'L3MON4D3/LuaSnip', 
    requires = {"rafamadriz/friendly-snippets"}} -- Snippets plugin
  use 'ayu-theme/ayu-vim'
  use {'nvim-treesitter/nvim-treesitter'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {"akinsho/toggleterm.nvim"}

  use 'windwp/nvim-autopairs'
  use 'goolord/alpha-nvim'
use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
}
use 'lewis6991/gitsigns.nvim'
use 'jose-elias-alvarez/null-ls.nvim'
use  'numToStr/Comment.nvim'
use 'Shatur/neovim-session-manager'
use 'bluz71/vim-moonfly-colors'
end)

