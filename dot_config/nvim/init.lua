local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)




vim.g.mapleader = " "
require("lazy").setup('plugins')
require("keymaps")
require("general")
require("lsp")
require("formatters")
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
-- require("nvim-treesitter.configs").setup({
-- 	sync_install = false,
-- 	ensure_installed = { "c", "lua", "python", "bash", "go", "json", "yaml", "toml", "gitignore", "gitcommit" },
-- 	highlight = {
-- 		enable = true,
-- 	},
-- })
-- require("gitsigns").setup({
-- 	current_line_blame_opts = {
-- 		virt_text = true,
-- 		virt_text_pos = "overlay", -- 'eol' | 'overlay' | 'right_align'
-- 		delay = 1000,
-- 		ignore_whitespace = false,
-- 	},
-- })
vim.cmd([[ highlight  gitsignscurrentlineblame guibg=#191724 guifg=#ffffff]])
require("dashboard").setup({
	-- config
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

