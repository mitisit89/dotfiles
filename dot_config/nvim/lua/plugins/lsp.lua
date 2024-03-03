-- require("mason").setup()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
-- local sign_cfg = {
-- 	bind = true,
-- 	floating_window = true,
-- 	hint_enable = false,
-- 	handler_opts = {
-- 		border = "rounded",
-- 	},
-- }
-- local on_attach = function(client, bufnr)
-- 	require("lsp_signature").on_attach(sign_cfg, bufnr)
-- end
--

--
-- local mason_lspconfig = require("mason-lspconfig")
--
-- mason_lspconfig.setup({
-- 	ensure_installed = vim.tbl_keys(servers),
-- })
-- mason_lspconfig.setup_handlers({
-- 	function(server_name)
-- 		require("lspconfig")[server_name].setup({
-- 			capabilities = capabilities,
-- 			on_attach = on_attach,
-- 			settings = servers[server_name],
-- 			filetypes = (servers[server_name] or {}).filetypes,
-- 		})
-- 	end,
-- })

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
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
				experimentalPostfixCompletions = true,
				analyses = {
					unusedparams = true,
					shadow = true,
				},
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
		require("mason").setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format lua code
			"ruff",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
