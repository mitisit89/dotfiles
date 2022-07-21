  local opts = {noremap = true, silent = true}
  local bind = vim.api.nvim_set_keymap

--Telescope
bind("n", "<leader>gt", ':Telescope lsp_definitions<CR>',opts )
bind("n", "<leader>ff", ':Telescope find_files<CR>,',opts )
bind( "n", "<leader>sf", ':Telescope current_buffer_fuzzy_find<CR>',opts )
bind("n", "<leader>sb", ':Telescope buffers<CR>',opts )
--NvimTree
bind('n', '<space>e', ':NvimTreeToggle<CR>', opts)
bind( 'n', '<space>b', ':NvimTreeFocus<CR>', opts)
bind('n', '<space>r', ':NvimTreeRefresh<CR>', opts)
--<A>-alt
bind('n', '<A-,>', ':BufferPrevious<CR>', opts)
bind('n', '<A-.>', ':BufferNext<CR>', opts) 
bind('n', '<C-c>', ':BufferClose<CR>',opts)
bind('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
bind('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
bind('n', 'F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
bind('t', '<esc>', '<C-\\><C-n>', opts)
-- Nvim Dap 
bind('n', '<leader>dp',':DapToggleBreakpoint<CR>',opts)
bind('n', '<leader>dc',':DapContinue<CR>',opts)
