require("plugins")
require("general")
require("keymaps")
require("lsp")
require("formatters")
require("nvim-tree").setup()
require("ayu").colorscheme()
require("ayu").setup({
	mirage = false,
})
require("nvim-autopairs").setup({})
require("toggleterm").setup({
	open_mapping = [[<c-t>]],
	direction = "float",
})

require("Comment").setup()
require("nvim-treesitter.configs").setup({
	sync_install = false,
	ensure_installed = { "c", "lua", "python", "bash", "go", "json", "yaml", "toml", "gitignore", "gitcommit" },
	highlight = {
		enable = true,
	},
})
require("gitsigns").setup({
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "overlay", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
})
vim.cmd([[ highlight  gitsignscurrentlineblame guibg=#191724 guifg=#ffffff]])
require("dashboard").setup({
	-- config
})
-- local null_ls = require("null-ls")
-- null_ls.setup({
-- 	on_attach = function(client, bufnr)
-- 		if client.supports_method("textDocument/formatting") then
-- 			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
-- 			vim.api.nvim_create_autocmd("BufWritePre", {
-- 				group = augroup,
-- 				buffer = bufnr,
-- 				callback = function()
-- 					vim.lsp.buf.format({ bufnr = bufnr })
-- 				end,
-- 			})
-- 		end
-- 	end,
-- 	sources = {
-- 		null_ls.builtins.formatting.stylua,
-- 		null_ls.builtins.diagnostics.eslint,
-- 		null_ls.builtins.formatting.black,
-- 		null_ls.builtins.formatting.gofmt,
-- 	},
-- })
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { ".venv", ".git" },
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
require("telescope").load_extension("harpoon")
require("telescope").load_extension("fzf")
local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "async_path" },
		{ name = "buffer" },
	},
})

require("lualine").setup()
