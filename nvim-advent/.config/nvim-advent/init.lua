-- Entry point for the neovim configuration

-- Meta: Basic keybindings for (re-)loading the config
-- vim is the main table that is accessible through the config
-- syntax: vim.keymap.set(MODE,KEY,ACTION)

-- reload the current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- execute the current line using the lua engine - notice the '.' selector for the current line
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- when there's a region selected, executed that with lua
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
