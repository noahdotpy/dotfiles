return {
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
        vala_ls = {},
        vls = {},
        zls = {},
      },
    },
  },
}
