local symbol_map = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"FelipeLema/cmp-async-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
	},

	opts = function()
		local luasnip = require("luasnip")
		local cmp = require("cmp")

		local cmp_ui = {
			icons = true,
			lspkind_text = true,
			style = "default", -- default/flat_light/flat_dark/atom/atom_colored
			border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
			selected_item_bg = "colored", -- colored / simple
		}
		local cmp_style = cmp_ui.style
		local field_arrangement = {
			atom = { "kind", "abbr", "menu" },
			atom_colored = { "kind", "abbr", "menu" },
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			formatting = {
				-- default fields order i.e completion word + item.kind + item.kind icons
				fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

				format = function(_, item)
					local icons = symbol_map
					local icon = (cmp_ui.icons and icons[item.kind]) or ""

					if cmp_style == "atom" or cmp_style == "atom_colored" then
						icon = " " .. icon .. " "
						item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
						item.kind = icon
					else
						icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
						item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
					end

					return item
				end,
			},
			window = {
				completion = {
					side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
					winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
					scrollbar = false,
					border = border("CmpBorder"),
				},
				documentation = {
					border = border("CmpDocBorder"),
					winhighlight = "Normal:CmpDoc",
				},
			},
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.kind,
					-- cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
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
	end,
}
