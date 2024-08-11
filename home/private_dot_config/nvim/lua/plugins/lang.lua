return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require("plugins.configs.treesitter")
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "rouge8/neotest-rust", "nvim-neotest/nvim-nio" },
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
  {
    "smjonas/inc-rename.nvim",
    opts = { input_buffer_type = "dressing" },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},
        gopls = {},
        jsonls = {},
        pyright = {},
        rnix = {},
        rust_analyzer = {},
        tsserver = {},
        vls = {},
        zls = {},
      },
    },
  },
  {
    "NoahTheDuke/vim-just",
    ft = { "just" },
  },

  "gpanders/nvim-parinfer",
  "alker0/chezmoi.vim",
  "simrat39/rust-tools.nvim",

  { import = "lazyvim.plugins.extras.lsp.none-ls" },
}
