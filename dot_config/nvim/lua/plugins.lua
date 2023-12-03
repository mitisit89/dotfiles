local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()
return require("packer").startup({
	function(use)
		-- Packer can manaffe itself
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
			"jose-elias-alvarez/null-ls.nvim",
			"Th3Whit3Wolf/one-nvim",
			"nvim-tree/nvim-web-devicons",
			"sindrets/diffview.nvim",
			--	"romgrk/barbar.nvim",
			"Shatur/neovim-ayu",
			"nvim-treesitter/nvim-treesitter",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			"nvim-lua/plenary.nvim",
			-- LSP Support
			"neovim/nvim-lspconfig", -- Required
			"williamboman/mason.nvim", -- Optional
			"williamboman/mason-lspconfig.nvim", -- Optional
			"ray-x/lsp_signature.nvim",
			-- Autocompletion
			"hrsh7th/nvim-cmp", -- Required
			"hrsh7th/cmp-nvim-lsp", -- Required
			"hrsh7th/cmp-buffer", -- Optional
			"FelipeLema/cmp-async-path", -- Optional
			"saadparwaiz1/cmp_luasnip", -- Optional
			"hrsh7th/cmp-nvim-lua", -- Optional

			-- Snippets
			"L3MON4D3/LuaSnip", -- Required
			"windwp/nvim-autopairs",
			"rafamadriz/friendly-snippets", -- Optional
			"akinsho/toggleterm.nvim",
			"lewis6991/gitsigns.nvim",
			"numToStr/Comment.nvim",
			"folke/trouble.nvim",
			"glepnir/dashboard-nvim",
			"nvimdev/guard.nvim",
			"folke/todo-comments.nvim",
		})

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
