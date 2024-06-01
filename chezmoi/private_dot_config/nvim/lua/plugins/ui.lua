return {
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
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
  {
    "henriklovhaug/Preview.nvim",
    cmd = { "Preview" },
    config = function()
      require("preview").setup()
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      inc_rename = true,  -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
  },

  "lewis6991/satellite.nvim",
}
