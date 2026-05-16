return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

		-- merge conflict case, gm will keep mine, gt keeps theirs
		vim.keymap.set("n", "gm", "<cmd>diffget //2<CR>")
		vim.keymap.set("n", "gt", "<cmd>diffget //3<CR>")

	end,
}
