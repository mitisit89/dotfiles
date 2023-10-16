require("mason").setup()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local sign_cfg = {
	bind = true,
	floating_window = true,
	hint_enable = false,
	handler_opts = {
		border = "rounded",
	},
}
local on_attach = function(client, bufnr)
	require("lsp_signature").on_attach(sign_cfg, bufnr)
end

local servers = {

	lua_ls = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	bashls = {
		filetypes = { "sh", "zsh", "bash" },
	},
	gopls = {
		staticcheck = true,
	},
	pyright = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
	yamlls = {},
	dockerls = {},
	tsserver = { hostInfo = "neovim" },
}

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})
mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		})
	end,
})
