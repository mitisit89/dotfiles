require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls", "eslint", "dockerls", "pylsp" },
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
require("lspconfig").gopls.setup({})
require("lspconfig").bashls.setup({})
require("lspconfig").yamlls.setup({})
require("lspconfig").pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391" },
					maxLineLength = 100,
				},
			},
		},
		capabilities = capabilities,
	},
})
require("lspconfig").dockerls.setup({})
require("lspconfig").volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})
require("lspconfig").tsserver.setup({})
