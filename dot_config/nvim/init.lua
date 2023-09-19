local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.g.mapleader = " "
require("lazy").setup("plugins")
require("keymaps")
require("general")
require("lsp")
require("formatters")
require("ayu").colorscheme()
require("ayu").setup({
	mirage = false,
})
vim.cmd([[ highlight  gitsignscurrentlineblame guibg=#191724 guifg=#ffffff]])

