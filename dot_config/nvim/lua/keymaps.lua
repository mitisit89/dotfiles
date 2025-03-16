local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
local gs = require("gitsigns")
map("n", "<leader>e", ":Neotree toggle position=float<CR>", opts)
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
map("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
map("n", "<leader>tt", function()
	require("trouble").toggle("diagnostics")
end, { desc = "document_diagnostics" }, opts)
map("v", "<leader>hs", function()
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }, { desc = "stage_hunk" })
end)
map("v", "<leader>hr", function()
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }, { desc = "reset_hunk" })
end)
map("n", "<leader>hS", gs.stage_buffer, { desc = "stage_buffer" })
map("n", "<leader>hR", gs.reset_buffer, { desc = "reset_buffer" })
map("n", "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { desc = "code_action" }, opts)
