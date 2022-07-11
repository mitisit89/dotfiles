require "packer".init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}
return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use { 'L3MON4D3/LuaSnip',
        requires = { "rafamadriz/friendly-snippets" } } -- Snippets plugin
    use { 'nvim-treesitter/nvim-treesitter' }
    use 'kyazdani42/nvim-tree.lua'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { "akinsho/toggleterm.nvim" }
    use 'windwp/nvim-autopairs'
    use 'goolord/alpha-nvim'
    use 'romgrk/barbar.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'numToStr/Comment.nvim'
    use 'Shatur/neovim-session-manager'
    use 'bluz71/vim-moonfly-colors'
    use "williamboman/nvim-lsp-installer"
    use "onsails/lspkind.nvim"
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { "ellisonleao/glow.nvim", branch = 'main' }
end)
