-- lazy.nvim
return {
	"folke/snacks.nvim",
	---@type snacks.Config
	priority = 1000,
	lazy = false,
	opts = {
		indent = { enabled = true, animate = { enabled = false } },
	},
}
