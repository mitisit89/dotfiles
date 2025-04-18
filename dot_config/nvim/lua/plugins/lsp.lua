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
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						library = {
							"${3rd}/luv/library",
							unpack(vim.api.nvim_get_runtime_file("", true)),
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			},
			bashls = {
				filetypes = { "sh", "zsh", "bash" },
			},
			gopls = {

				init_options = {

					usePlaceholders = true,
				},
				buildFlags = { "-tags=integration" },
				experimentalPostfixCompletions = true,
				analyses = {
					unusedparams = true,
					shadow = true,
					modernize = true,
				},
				staticcheck = true,
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			},
			basedpyright = {
				python = {
					analysis = {
						autoImportCompletions = true,
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						typeCheckingMode = "basic",
						useLibraryCodeForTypes = true,
					},
				},
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			},
			yamlls = {},
			dockerls = {},
			jsonls = {},
			typos_lsp = {},
		}
		require("mason").setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format lua code
			"ruff",
			"goimports",
			"shfmt",
			"golangci-lint",
			"gopls",
			"yamlls",
			"basedpyright",
			"dockerls",
			"jsonls",
			"hadolint",
			"shellcheck",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed, auto_update = true })
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
