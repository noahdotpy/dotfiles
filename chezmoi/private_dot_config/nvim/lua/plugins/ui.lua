return {
  {
    "folke/which-key.nvim",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["<leader>d"] = { name = "+dots" },
        ["<leader>da"] = { name = "+apply" },
        ["<leader>n"] = { name = "+neotree" },
        ["h"] = { name = "+hop" },
      },
    },
  },
}
