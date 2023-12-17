return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"Mofiqul/adwaita.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			vim.g.adwaita_disable_cursorline = true -- to disable cursorline
			vim.g.adwaita_transparent = true -- makes the background transparent
		end,
	},
	{
		"neanias/everforest-nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard",
			})
		end,
	},
}
