return require("packer").startup(function(use)
	-- Packer can manage itself
	use({
		"wbthomason/packer.nvim",
		{
			"nvim-tree/nvim-tree.lua",
			tag = "nightly",
		},
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.x",
		},
		"nvim-lualine/lualine.nvim",
		"navarasu/onedark.nvim",
		"tjdevries/colorbuddy.nvim",
		"Th3Whit3Wolf/onebuddy",
		"jose-elias-alvarez/null-ls.nvim",
		"Th3Whit3Wolf/one-nvim",
		"nvim-tree/nvim-web-devicons",
		"romgrk/barbar.nvim",
		"Shatur/neovim-ayu",
		"nvim-treesitter/nvim-treesitter",
		{ "bluz71/vim-moonfly-colors", as = "moonfly" },
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		"nvim-lua/plenary.nvim",
		-- LSP Support
		"neovim/nvim-lspconfig", -- Required
		"williamboman/mason.nvim", -- Optional
		"williamboman/mason-lspconfig.nvim", -- Optional

		-- Autocompletion
		"hrsh7th/nvim-cmp", -- Required
		"hrsh7th/cmp-nvim-lsp", -- Required
		"hrsh7th/cmp-buffer", -- Optional
		"hrsh7th/cmp-path", -- Optional
		"saadparwaiz1/cmp_luasnip", -- Optional
		"hrsh7th/cmp-nvim-lua", -- Optional

		-- Snippets
		"L3MON4D3/LuaSnip", -- Required
		"windwp/nvim-autopairs",
		"rafamadriz/friendly-snippets", -- Optional
		"akinsho/toggleterm.nvim",
		"lewis6991/gitsigns.nvim",
		"TimUntersberger/neogit",
		"numToStr/Comment.nvim",
	})
end)
