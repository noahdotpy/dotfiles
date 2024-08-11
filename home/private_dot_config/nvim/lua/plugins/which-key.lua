return {
  "folke/which-key.nvim",
  opts = {
    plugins = { spelling = true },
    spec = {
      mode = { "n", "v" },
      ["<leader>d"] = { name = "+dots" },
      ["<leader>n"] = { name = "+neotree" },
      -- TODO: This does not properly show in which-key
      ["h"] = { name = "+hop" },
    },
  },
}
