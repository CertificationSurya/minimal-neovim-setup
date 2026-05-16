return {
	-- our language server configure
	"neovim/nvim-lspconfig",

	-- server config dependencies
	dependencies = {
		"stevearc/conform.nvim", -- code formatter
		"williamboman/mason.nvim", -- lsp server manager, could manually add server and hook to lsp config but tuff
		"williamboman/mason-lspconfig.nvim", -- handles bridging mason -> lsp-config automatically

		-- auto completion
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",

		-- snippet provider
		"L3MON4D3/LuaSnip", -- provides snippet for other languages too
		-- linker for snippet provider -> completion system
		"saadparwaiz1/cmp_luasnip",

		-- loader screen
		"j-hui/fidget.nvim",
	},

	config = function()
		--## configuring dependencies
		require("conform").setup({
			formatters_by_ft = { -- no formatter choosed
			}
		})

		-- loads auto completion feature
		local cmp = require('cmp')
		-- load bridge
		local cmp_lsp = require("cmp_nvim_lsp")

		-- merge both lsp and cmp for better autocompletion
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- for lua, to config nvim
					"lua_ls",
					-- ts, js
					"vtsls",
					"html",
					"cssls",
					"tailwindcss",
					-- python
					"pyright",
					-- C#
					"csharp_ls",
				},

				handlers = {
					-- default handler
					function(server_name)
						require("lspconfig")[server_name].setup{
							capabilities = capabilities
						}
					end,

					-- lua specific
					["lua_ls"] = function()
						local lspconfig = require("lspconfig")

						lspconfig.lua_ls.setup {
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = {
										version = 'LuaJIT',
									},
									diagnostics = {
										globals = { 'vim' },
									},
									workspace = {
										library = vim.api.nvim_get_runtime_file("", true),
										checkThirdParty = false,
									},
									format = {
										enable = true,
										-- Put format options here
										-- NOTE: the value should be STRING!!
										defaultConfig = {
											indent_style = "space",
											indent_size = "2",
										}
									},
								}
							}
						}
					end,

					["tailwindcss"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.tailwindcss.setup({
							capabilities = capabilities,
							filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
						})
					end,

				}


			})
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = "copilot", group_index = 2 },
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }, -- For luasnip users.
				}, {
					{ name = 'buffer' },
				})
			})

			vim.diagnostic.config({
				-- update_in_insert = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end


	}
