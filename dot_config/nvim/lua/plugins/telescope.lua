return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = vim.fn.executable("make") == 1 and "make"
				or "cmake -S. -Bbuease && cmake --build build --config Release && cmake --install build --prefix build",
			enabled = vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1,
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	opts = {

		defaults = {
			file_ignore_patterns = { ".venv", ".git" },
		},
		path_display = { "truncate" },
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	},
}
