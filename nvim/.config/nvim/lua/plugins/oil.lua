local oil_opts = {
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
  },
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,}
}
return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
    require("oil").setup(oil_opts)
    vim.keymap.set("n", "-", "<cmd>Oil<CR>")
  end,
}
