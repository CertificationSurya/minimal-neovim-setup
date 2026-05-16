local function themeColoring(color)
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	-- changing highlight group config, 0 -  namespace, "Normal" or "NormalFloat" is highlight group, {} is config
	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg ="none"})
end

return {

	{
		"rebelot/kanagawa.nvim",
		priority = 1000, -- basically loads first than others

		config = function()
--			themeColoring()
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require('rose-pine').setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})

			themeColoring("rose-pine-moon");
		end
	},

}
