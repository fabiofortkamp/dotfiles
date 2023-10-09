-- table of plugins that are returned and loaded by chadrc.lua
-- keep in mind that, in Lua, 'tables' can be 1D arrays or dicts;
-- in the case below, we have a list of dicts
local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
      opts= {
        ensure_installed = {
        "rust-analyzer",
      },

    },
  }
}
return plugins
