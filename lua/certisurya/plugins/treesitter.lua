 return {
	{
		'nvim-treesitter/nvim-treesitter',
		--lazy = false,
		build = ':TSUpdate',
		event =  {"BufReadPre", "BufNewFile"},


		config = function()
			-- language parser listing
			local langParser = {
				"lua",
				"vim",
				"c",
				"cpp",
				"c_sharp",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"python",
				"json",
				"gitignore",
			}

			-- will create autocmd group, and clears existing with same name
			local group = vim.api.nvim_create_augroup("CertiSuryaTreesitter", { clear = true })

			-- when i be familiar imma go auto cmd shiii

			-- determining path for parser installation
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			--setting up
			require("nvim-treesitter").setup({});

			--install parsers
			require("nvim-treesitter").install(langParser);

			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				pattern = langParser,

				callback = function()
					pcall(vim.treesitter.start)
				end,
			})

			-- for func and class 
		--	require("nvim-treesitter").setup({
		--		textobjects = {
		--			select = {
		--				enable = true,
		--				lookahead = true,

		--				keymaps = {
		--					["af"] = "@function.outer",
		--					["if"] = "@function.inner",
		--					["ac"] = "@class.outer",
		--					["ic"] = "@class.inner",
		--				},
		--			},
		--		},
		--	})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch="main",
		lazy = false,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			})
		end,
	},


}




