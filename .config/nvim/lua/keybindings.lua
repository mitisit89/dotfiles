  local default_opt = {noremap = true, silent = true}
  local nvim_set_keymap = vim.api.nvim_set_keymap
vim.g.mapleader=' '

--Telescope
nvim_set_keymap("n", "<leader>ff", ':lua require"telescope.builtin".find_files()<CR>',default_opt )
nvim_set_keymap( "n", "<leader>sf", ':lua require"telescope.builtin".current_buffer_fuzzy_find({ previewer = false, sorting_strategy="ascending" })<CR>',default_opt )
nvim_set_keymap("n", "<leader>sb", ':lua require"telescope.builtin".buffers()<CR>',default_opt )
--NvimTree
vim.cmd"nmap <space>e :NvimTreeToggle<CR>"
vim.cmd"map <space>r :NvimTreeRefresh<CR>"
--Barbar
--<A>-alt
nvim_set_keymap('n', '<A-,>', ':BufferPrevious<CR>', default_opt)
nvim_set_keymap('n', '<A-.>', ':BufferNext<CR>', default_opt) 
nvim_set_keymap('n', '<C-c>', ':BufferClose<CR>',default_opt)
