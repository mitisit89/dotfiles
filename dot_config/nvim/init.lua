require("plugins")
require("general")
require("keymaps")
require("nvim-tree").setup()
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.setup_servers({ "tsserver", "eslint", "lua" })

lsp.setup()
require("ayu").colorscheme()
require("ayu").setup({
	mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
})
require("lualine").setup()
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black,
	},
})
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

