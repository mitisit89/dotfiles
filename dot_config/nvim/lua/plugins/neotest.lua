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
					env = { DJANGO_SETTINGS_MODULE = "Redadm.settings" },
					dap = { justMyCode = false },
					runner = "DjangoUnittestRunner",
					python = ".venv/bin/python",
				}),
			},
		})
	end,
}
