vim.g.mapleader = " "

-- explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- moving line up down (visual mode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- up

-- open diagnostic 
vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float);

-- half page movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cursor in mid when search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- exit search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- paste without voiding previous selected text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- quickfix list, basically diagonistic window 
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace all focused text on the file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- executable maker
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
