-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cx", "<cmd>source %<CR>", { desc = "Source file" })
vim.keymap.set("n", "<leader>cy", ":.lua<CR>", { desc = "Source line/region" })
vim.keymap.set("v", "<leader>cy", ":lua<CR>", { desc = "Source line/region" })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Terminal customizations
-- floating terminal
local map = vim.keymap.set
local wk = require("which-key")
wk.add({ { "<leader>t", group = "Terminal" } })
map("n", "<leader>tT", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })
map("n", "<leader>tt", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })
map("n", "<c-/>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })
map("n", "<c-_>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "which_key_ignore" })
-- Terminal Mappings
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
map("n", "<C-s>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
