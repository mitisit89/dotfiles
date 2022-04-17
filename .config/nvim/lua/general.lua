local o=vim.o

o.number=true
o.backup=false
o.encoding='utf-8'
o.writebackup=false
o.smarttab=true
o.termguicolors = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.swapfile=false
o.autoindent=true
o.showmode=false
o.smartindent=true
o.splitright=true
o.splitbelow=true
o.signcolumn='yes'
--o.syntax='on'
o.filetype="plugin"
--o.guicursor=' '
vim.cmd 'let g:python3_host_prog = expand("/usr/bin/python")'
--vim.cmd 'let ayucolor="dark"'
--vim.cmd 'colorscheme ayu'
vim.cmd [[colorscheme moonfly]]
vim.opt.showtabline = 2
o.smartcase = true
o.smartindent = true
o.title = true 
o.expandtab = true 
o.copyindent = true 
o.wrap=false
o.completeopt = 'menuone,noselect'
o.updatetime = 250

vim.diagnostic.config({virtual_text = false})
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

