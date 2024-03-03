return {

	"nvim-treesitter/nvim-treesitter",
	buiiii = ":TSUpdate",
	opts = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "python", "bash", "go", "json", "yaml", "toml", "gitignore", "gitcommit" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
