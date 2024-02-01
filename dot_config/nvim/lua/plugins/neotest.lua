return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					env = { DJANGO_SETTINGS_MODULE = "AppName.settings" },
					dap = { justMyCode = false },
					args = { "--log-level", "DEBUG" },
					runner = "django",
				}),
			},
		})
	end,
}
