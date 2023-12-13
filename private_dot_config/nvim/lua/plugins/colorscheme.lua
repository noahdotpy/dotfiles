return {
	{ "folke/tokyonight.nvim", lazy = true },
	{ "Mofiqul/adwaita.nvim", lazy = true },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = true },
	{ "catppuccin/nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("everforest").setup({
				background = "hard",
			})
		end,
	},
}
