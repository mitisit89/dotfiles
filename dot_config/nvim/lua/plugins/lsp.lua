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
			"goimports",
			"cspell",
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
