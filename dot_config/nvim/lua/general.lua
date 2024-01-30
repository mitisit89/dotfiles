local opts = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	colorcolumn = "99999", -- fixes indentline for now
	completeopt = { "menuone", "noselect" },
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	foldmethod = "manual", -- folding set to "expr" for treesitter based folding
	foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
	hidden = true, -- required to keep multiple buffers and open multiple buffers
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	copyindent = true,
	splitbelow = true, -- force all horizontal splits to go below current window
	autoindent = true,
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	undodir = vim.fn.stdpath("cache") .. "/undo",
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	softtabstop = 4,
	tabstop = 4, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	spell = true,
	spelllang = "en_us",
	scrolloff = 8, -- is one of my fav
	completion_sorting = "none",
	sidescrolloff = 8,
	-- timeoutlen = 850, -- time to wait for a mapped sequence to complete (in milliseconds) useful for mech keyboard
}

for key, value in pairs(opts) do
	vim.opt[key] = value
end
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

-- vim.g.loaded_netrw = 1
-- vim.cmd[[colorscheme synthwave84]]

vim.g.loaded_netrwPlugin = 1
vim.cmd([[colorscheme tokyonight]])
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end
local config = {
	virtual_text = false,
	signs = {
		active = signs, -- show signs
	},
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "single",
		source = "always",
		header = "Diagnostic",
		prefix = "",
	},
}
vim.diagnostic.config(config)
vim.api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local opt = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "line",
		}
		vim.diagnostic.open_float(nil, opt)
	end,
})
vim.cmd([[ highlight  gitsignscurrentlineblame guibg=#191724 guifg=#ffffff]])
