local options = {
    number = true,
    backup = false,
    encoding = 'utf-8',
    writebackup = false,
    smarttab = true,
    termguicolors = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    swapfile = false,
    autoindent = true,
    showmode = false,
    smartindent = true,
    splitright = true,
    splitbelow = true,
    signcolumn = 'yes',
    smartcase = true,
    title = true,
    expandtab = true,
    copyindent = true,
    wrap = false,
    completeopt = 'menuone,noselect',
    updatetime = 250,
    clipboard = 'unnamedplus',
    pumheight = 7,
    filetype = "plugin",
    showtabline = 2

}
for key, value in pairs(options) do
    vim.opt[key] = value
end
vim.cmd [[colorscheme moonfly]]

vim.diagnostic.config({ virtual_text = false })
vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})
