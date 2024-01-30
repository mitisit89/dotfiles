return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			change_to_vcs_root = true,
			config = {
				project = {
					enable = true,
				},
			},
		})
	end,

	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
