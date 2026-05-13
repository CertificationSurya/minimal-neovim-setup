local lazyInstallPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- data = ~/local/share/nvim + "lazy/lazy.nvim"

-- if lazy isn't installed then install
if not vim.loop.fs_stat(lazyInstallPath) then
	-- execute below script to terminal from nvim
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazyInstallPath,
	})
end

-- adding path to runtime. env variable in window
vim.opt.rtp:prepend(lazyInstallPath)

-- defining where my plugin will be i.e certisurya/plugin
require("lazy").setup({
	spec = "certisurya.plugins",
	change_detection = { notify = false }
})
