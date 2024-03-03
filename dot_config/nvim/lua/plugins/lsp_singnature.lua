return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
		timer_interval = 20,
	},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}
