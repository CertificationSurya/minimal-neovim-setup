
-- copy to system register not only on vim register
vim.opt.clipboard = "unnamedplus"

-- line num and relative line number
vim.opt.nu = true
vim.opt.rnu = true

--  indentation
 vim.opt.tabstop = 4
 vim.opt.softtabstop = 4
 vim.opt.shiftwidth = 4
 vim.opt.expandtab = true

-- no wrap
vim.opt.wrap = false

-- no swap file
vim.opt.swapfile = true

-- for undo tree
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undodir =  vim.fn.expand("~/.vim/undodir")
vim.opt.backup = false

-- incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- 24 bit color scheme sup
vim.opt.termguicolors = true

-- min scroll line
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "115"

-- auto suggest height
vim.opt.pumheight = 8
