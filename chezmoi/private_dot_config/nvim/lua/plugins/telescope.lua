return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "jvgrootveld/telescope-zoxide",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      local z_utils = require("telescope._extensions.zoxide.utils")

      return {
        extensions = {
          zoxide = {
            prompt_title = "[ Walking on the shoulders of TJ ]",
            mappings = {
              default = {
                after_action = function(selection)
                  print("Update to (" .. selection.z_score .. ") " .. selection.path)
                end,
              },
              ["<C-s>"] = {
                before_action = function(selection)
                  print("before C-s")
                end,
                action = function(selection)
                  vim.cmd.edit(selection.path)
                end,
              },
              -- Opens the selected entry in a new split
              ["<C-q>"] = { action = z_utils.create_basic_command("split") },
            },
          },
        },
      }
    end,
    config = function()
      require("telescope").load_extension("zoxide")
    end,
    keys = {
      {
        "n",
        "<leader>z",
        require("telescope").extensions.zoxide.list(),
        desc = "Change directories with zoxide",
      },
    },
  },
}
