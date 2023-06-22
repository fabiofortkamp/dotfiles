lvim.builtin.treesitter.ensure_installed = {
  "python",
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup{{name = "black"},}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", args = {"--ignore=E230", filetypes = {"python"}}}}

lvim.plugins = {
  "AckslD/swenv.nvim",
  "stevearc/dressing.nvim"
}

require("swenv").setup({
  post_set_venv = function()
    vim.cmd("LspRestart")
  end,
})

lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = {"<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env"}
}

