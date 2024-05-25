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
    {
      "stevearc/oil.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("oil").setup({
          columns = { "icon" },
          keymaps = {
            ["<C-h>"] = false,
            ["<M-h>"] = "actions.select_split",
          },
          view_options = {
            show_hidden = true,
          },
        })

        -- Open parent directory in current window
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

        -- Open parent directory in floating window
        vim.keymap.set("n", "<space>-", require("oil").toggle_float)
      end,
    },
  },
}
