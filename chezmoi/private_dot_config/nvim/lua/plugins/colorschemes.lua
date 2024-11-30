return {
  {
    "Shatur/neovim-ayu",
    lazy = true,
    opts = {},
  },
  {
    "neanias/everforest-nvim",
    lazy = true,
    version = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    version = "1.x.x",
    lazy = true,
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    version = "2.x.x",
    priority = 1000,
  },

  -- {
  --   "f-person/auto-dark-mode.nvim",
  --   opts = {
  --     update_interval = 1000,
  --     set_dark_mode = function()
  --       vim.cmd("colorscheme catppuccin-mocha")
  --     end,
  --     set_light_mode = function()
  --       vim.cmd("colorscheme catppuccin-latte")
  --     end,
  --   },
  -- },
}
