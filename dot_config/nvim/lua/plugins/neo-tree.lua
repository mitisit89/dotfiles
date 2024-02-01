return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			enable_git_status = true,
			enable_diagnostics = true,
			window = {
				position = "left",
				width = 30,
			},
			filesystem = {
				filtered_items = {
					visible = true,
				},
			},
			use_libuv_file_watcher = true,
		})
	end,
}
