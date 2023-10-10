-- get the keys from the default lspconfig installation 
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Customize the Rust LSP, by passing the default options but attaching it to
-- rust filetypes and setting the root of a project as the folder which contains
-- the Cargo.toml file
lspconfig.rust_analyzer.setup({
  on_attach=on_attach,
  capabilities=capabilities,
  filetypes= { "rust"},
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})


lspconfig.pyright.setup({
  on_attach=on_attach,
  capabilities=capabilities,
  filetypes= { "python"},
})
