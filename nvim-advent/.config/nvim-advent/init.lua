-- Entry point for the neovim configuration

vim.g.mapleader = "<space>"
vim.g.maplocalleader = ","
-- lazy.nvim config
require("config.lazy")

-- Meta: Basic keybindings for (re-)loading the config
-- vim is the main table that is accessible through the config
-- syntax: vim.keymap.set(MODE,KEY,ACTION)
-- reload the current file
vim.keymap.set("n", "<localleader><localleader>x", "<cmd>source %<CR>")
-- execute the current line using the lua engine - notice the '.' selector for the current line
vim.keymap.set("n", "<localleader>x", ":.lua<CR>")
-- when there's a region selected, executed that with lua
vim.keymap.set("v", "<localleader>x", ":lua<CR>")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Some basic options
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
