lvim.builtin.treesitter.ensure_installed = {
  "python",
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup{{name = "black"},}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", args = {
  "--ignore=E203", -- whitespace before ‘,’, ‘;’, or ‘:’
  "--max-line-length=88", -- for black compatibility
  filetypes = {"python"}}}}

lvim.plugins = {
  "AckslD/swenv.nvim",
  "stevearc/dressing.nvim",
"JuliaEditorSupport/julia-vim"}

require("swenv").setup({
  post_set_venv = function()
    vim.cmd("LspRestart")
  end,
})

lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = {"<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env"}
}

local pyright_opts = {
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- openFilesOnly, workspace
        typeCheckingMode = "basic", -- off, basic, strict
        useLibraryCodeForTypes = true
      }
    }
  },
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)

require'lspconfig'.marksman.setup{}
