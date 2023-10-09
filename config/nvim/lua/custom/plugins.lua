-- table of plugins that are returned and loaded by chadrc.lua
-- keep in mind that, in Lua, 'tables' can be 1D arrays or dicts;
-- in the case below, we have a list of dicts, with the GitHub repo
-- as the 'head' of each dict; I suppose the keys are required by each plugin
local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      -- these are paths relative to the neovim init lua folder
      -- this is the default one installed by nvChad
      require "plugins.configs.lspconfig"
      -- and this is the one in the current repo
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
