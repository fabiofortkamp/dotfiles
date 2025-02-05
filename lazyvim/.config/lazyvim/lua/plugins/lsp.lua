return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {},
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "flake8",
        "mypy",
        "basedpyright",
        "isort",
        "black",
        "matlab-language-server",
      },
    },
  },
  { "williamboman/mason-lspconfig.nvim", config = function() end },
}
