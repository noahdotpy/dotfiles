-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.listchars = { eol = "↵", space = "␣", tab = ">~" }
vim.opt.list = false

vim.opt.clipboard = "" -- Don't use system clipboard

vim.o.foldlevel = 99
-- vim.o.foldcolumn = '1' -- Enables fold indicators on the side of the window
vim.wo.foldnestmax = 99
vim.wo.foldminlines = 1
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.foldtext =
[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' ... ' . '(' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.cmd("highlight Folded ctermbg=NONE guibg=NONE")
vim.cmd("highlight FoldColumn ctermfg=NONE guifg=NONE")
