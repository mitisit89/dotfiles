return {

	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "python", "bash", "go", "json", "yaml", "toml", "gitignore", "gitcommit" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
