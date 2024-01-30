local map = vim.keymap.set

local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
local harpoon = require("harpoon")
map("n", "<leader>e", ":Neotree toggle<CR>", opts)
map("n", "<C-b>", ":Neotree focus<CR>", opts)
-- map("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
-- map("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

map("n", "<Leader>ff", builtin.git_files, { desc = "git_files" }, opts)
map("n", "<leader>gf", builtin.live_grep, { desc = "live_grep" }, opts)
map("n", "<leader>fb", builtin.buffers, { desc = "find_buffers" }, opts)
map("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "current_buffer_fuzzy_find" }, opts)
map("n", "<leader>fb", builtin.buffers, { desc = "find_buffers" }, opts)
map("n", "<leader>ld", builtin.lsp_definitions, { desc = "lsp_definitions" }, opts)
map("n", "<leader>lr", builtin.lsp_references, { desc = "find_buffers" }, opts)
map("n", "<Leader>sv", "<C-w>v", { desc = "open split vertically" })
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<leader>tt", function()
	require("trouble").toggle("workspace_diagnostics")
end, opts)

map("n", "<leader>a", function()
	harpoon:list():append()
end)
map("n", "<leader>l", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
