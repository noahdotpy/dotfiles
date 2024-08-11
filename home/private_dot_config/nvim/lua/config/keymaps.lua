-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = require("util").map

map("n", "<C-Left>", "")

map("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window " })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window " })
map("n", "<C-Left>", "<C-w>h", { desc = "Go to left window " })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to right window " })

map("n", "<C-M-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map("n", "<C-M-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-M-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-M-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-M-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map({ "n", "v" }, ",", '"d')

map("n", "<leader>w=", "<C-W>=", { desc = "Equally high and wide" })

map("n", "<leader>uh", "<cmd>set list!<cr>", { desc = "Toggle hidden characters visibility" })
map("n", "<leader>uz", "zi", { desc = "Toggle fold visibility" })

map("n", "<leader>fw", function()
  vim.api.nvim_set_current_win(require("window-picker").pick_window() or vim.api.nvim_get_current_win())
end, { desc = "Pick a window " })

-- TODO: Describe these better
map("n", "<leader>nq", "<cmd>:Neotree close<cr>", { desc = "Close neotree" })
map("n", "<leader>nf", "<cmd>:Neotree toggle source=filesystem<cr>", { desc = "Open filesystem neotree" })
map("n", "<leader>nb", "<cmd>:Neotree toggle source=buffers<cr>", { desc = "Open buffers neotree" })
map("n", "<leader>ng", "<cmd>:Neotree toggle source=git_status<cr>", { desc = "Open git_status neotree" })
map("n", "<leader>e", "<cmd>:Neotree float source=filesystem<cr>", { desc = "Open filesystem neotree" })

-- TODO: Add descriptions
local hop = require("hop")
map({ "n", "v" }, "hp", "<cmd>HopPattern<cr>")
map({ "n", "v" }, "hl", "<cmd>HopVertical<cr>")
map({ "n", "v" }, "ha", "<cmd>HopAnywhere<cr>")
map({ "n", "v" }, "hw", "<cmd>HopWord<cr>")
map({ "n", "v" }, "f", function()
  hop.hint_char1({ current_line_only = true })
end)
map({ "n", "v" }, "t", function()
  hop.hint_char1({ current_line_only = true, hint_offset = -1 })
end)
map({ "n", "v" }, "F", function()
  hop.hint_char1()
end)
map({ "n", "v" }, "T", function()
  hop.hint_char1({ hint_offset = -1 })
end)

map("n", "<leader>da", function()
  vim.fn.system({ "chezmoi", "apply" })
end, { desc = "Apply chezmoi changes" })

map("n", "<leader>de", "<cmd>e ~/.local/share/chezmoi<cr>", { desc = "Edit dotfiles" })

map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>p", '"+p')

map({ "n", "v" }, "<tab>", "<cmd>bnext<cr>")
map({ "n", "v" }, "<S-tab>", "<cmd>bprevious<cr>")

map(
  "n",
  "<leader>fx",
  "<cmd>!chmod +x %<cr>", -- .. vim.cmd('expand("%:p")') .. "<cr>",
  { desc = "Make current file executable" }
)

map({ "n", "v" }, "<leader>qp", "<cmd>CdProject<cr>", { desc = "Cd Project" })
map({ "n", "v" }, "<leader>qa", "<cmd>CdProjectAdd<cr>", { desc = "Add Project" })
