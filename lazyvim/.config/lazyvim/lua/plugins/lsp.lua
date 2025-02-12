return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      solargraph = {},
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
        "solargraph",
        "rubocop",
      },
    },
  },
  { "williamboman/mason-lspconfig.nvim", config = function() end },
}
