return {
	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			return require("plugins.configs.treesitter")
		end,
	},

	-- add symbols-outline
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		config = true,
	},

	{
		"rcarriga/nvim-dap-ui",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{ "nvim-telescope/telescope-dap.nvim" },
	{ "theHamsta/nvim-dap-virtual-text", opts = {} },
	{ "HUAHUAI23/telescope-dapzzzz" },
	{ "simrat39/rust-tools.nvim", opts = {} },
	{ "mxsdev/nvim-dap-vscode-js" },
	{
		"nvim-neotest/neotest",
		dependencies = { "rouge8/neotest-rust" },
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rust"),
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		lazy = false,
		opts = function()
			return require("plugins.configs.none-ls")
		end,
	},

	{
		"olexsmir/gopher.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	},

	"alker0/chezmoi.vim",

	{ import = "lazyvim.plugins.extras.lsp.none-ls" },
}
