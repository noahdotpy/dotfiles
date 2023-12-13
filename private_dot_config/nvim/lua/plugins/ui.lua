return {
  {
    "folke/which-key.nvim",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["<leader>n"] = { name = "+neotree" },
        ["h"] = { name = "+hop" }
      },
    },
  }
}
