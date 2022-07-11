require("plugins")
require("general")
require("keybindings")
require("nvim-lsp-installer").setup {
}


require('nvim-autopairs').setup {}
local lsp_servers = { 'dockerls', 'vuels', 'yamlls',
    'emmet_ls', 'tsserver',
    'gopls', 'eslint', 'jsonls',
    'sumneko_lua', "taplo", "pyright",'pasls' }
for _, lsp in pairs(lsp_servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
    }
end


require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.gofmt
    },

})
require('telescope').setup {}
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require 'nvim-tree'.setup {
    disable_netrw = false,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    open_on_tab = true,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 20,
        height = 20,
        hide_root_folder = false,
        side = 'left',
    }
}
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
require('Comment').setup()
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspkind = require('lspkind')
-- luasnip setup
require("luasnip/loaders/from_vscode").lazy_load()
local luasnip = require("luasnip")
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = 'text',
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
            }),
        })
    },
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
        { name = 'path' },
        { name = 'buffer' }
    },
}
require("toggleterm").setup {
    -- size can be a number or function which is passed the current terminal
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_terminals = true,
    shading_factor = 2,
    presist_size = true,
    direction = 'float',
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
require 'alpha'.setup(require 'alpha.themes.startify'.config)
require('session_manager').setup { autoload_mode = require('session_manager.config').AutoloadMode.Disabled }
require 'lualine'.setup({ options = { theme = 'moonfly' } })
