-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cx", "<cmd>source %<CR>", { desc = "Source file" })
vim.keymap.set("n", "<leader>cy", ":.lua<CR>", { desc = "Source line/region" })
vim.keymap.set("v", "<leader>cy", ":lua<CR>", { desc = "Source line/region" })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
