local ft = require("guard.filetype")

ft("lua"):fmt("stylua")
ft("python"):fmt("black"):append("isort")
ft("go"):fmt("lsp")

-- Call setup() LAST!
require("guard").setup({
	-- the only options for the setup function
	fmt_on_save = true,
	-- Use lsp if no formatter was defined for this filetype
	lsp_as_default_formatter = false,
})
