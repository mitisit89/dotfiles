return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup()
	end,
	keys = {
		{
			"<leader>ri",
			mode = "v",
			[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
			{ desc = "Refactoring from the primagen", noremap = true, silent = true, expr = false },
		},
	},
}
