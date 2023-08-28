local map = vim.keymap.set
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")

map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
map("n", "<C-b>", ":NvimTreeFocus<CR>", opts)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
map("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

map("n", "<Leader>ff", builtin.git_files, { desc = "git_files" }, opts)
map("n", "<leader>gf", builtin.live_grep, { desc = "live_grep" }, opts)
map("n", "<leader>fb", builtin.buffers, { desc = "find_buffers" }, opts)
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "lsp_document_symbols" }, opts)

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<leader>a", '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
map("n", "<leader>l", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", opts)
