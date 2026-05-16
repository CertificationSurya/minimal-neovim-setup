vim.g.mapleader = " "

-- explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- moving line up down (visual mode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- up

