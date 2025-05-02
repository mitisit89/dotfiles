local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = { "davidmh/cspell.nvim", "gbprod/none-ls-shellcheck.nvim" },
	config = function()
		local cspell = require("cspell")
		local nls = require("null-ls")
		nls.setup({
			sources = {
				cspell.diagnostics.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.severity = vim.diagnostic.severity.HINT
					end,
				}),
				cspell.code_actions,
				require("none-ls-shellcheck.diagnostics"),
				require("none-ls-shellcheck.code_actions"),
				nls.builtins.diagnostics.hadolint,
				nls.builtins.diagnostics.golangci_lint,
			},
		})
	end,
}
