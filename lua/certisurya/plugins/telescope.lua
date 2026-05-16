return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    -- config & keybinds
    config = function()
--	    require('telescope').setup({})

	    local builtInFunc = require ("telescope.builtin")
	    -- keybinds
	    vim.keymap.set('n', "<leader>f", builtInFunc.find_files, { desc="shows all files"} )
	    vim.keymap.set('n', "<C-p>", builtInFunc.git_files, {desc = "shows git tracked files"})

	   -- greping file 
	    vim.keymap.set('n', "<leader>g", function()
		builtInFunc.grep_string({ search = vim.fn.input("Grep > ") } )
	    end)
    end
}
