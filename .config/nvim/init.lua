require("plugins")
require("general")
require("keybindings")

-- require('github-theme').setup({
-- theme_style = "dimmed",
-- dark_sidebar=true,
-- colors = {bg = "#0d1117"},
-- }

--)
require'lspconfig'.eslint.setup{}
vim.g.bufferline = {
    closable = false,
   }
require('nvim-autopairs').setup{}
require'lspconfig'.gopls.setup{}

lsp_servers={'dockerls','vuels','yamlls','cssls','html','emmet_ls','tsserver','pyright'}
for _, lsp in pairs(lsp_servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end


require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.gofmt
    },

})
require('telescope').setup{}
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
    disable_netrw       = false,
    hijack_netrw        = false,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    --auto_close          = true,
    open_on_tab         = true,
    hijack_cursor       = true,
    update_cwd          = false,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    filters = {
      dotfiles = true,
      custom = {}
    },
    view = {
      width = 20,
      height = 20,
      hide_root_folder = false,
      side = 'left',
      auto_resize = false,
    }
  }
  
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
 
require('Comment').setup()
  -- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


-- luasnip setup
require("luasnip/loaders/from_vscode").lazy_load()
local luasnip = require("luasnip")
-- nvim-cmp setup
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
  luasnip.lsp_expand(args.body)  
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
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
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    {name='path'},
    {name='buffer'}
  },
}
require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_terminals=true,
	shading_factor=2,
	presist_size=true,
	direction='float',
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
  }
 require('gitsigns').setup() 
require'alpha'.setup(require'alpha.themes.startify'.config)
require('session_manager').setup {
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
}



require'lualine'.setup({options = {theme = 'moonfly'}})


