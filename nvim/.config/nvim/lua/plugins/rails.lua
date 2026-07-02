return {
  -- Rails-aware editing and file navigation.
  --
  -- vim-rails adds Rails project detection and navigation commands:
  --   :A                 jump to the "alternate" file (e.g. model <-> spec/test)
  --   :R                 jump to the "related" file (e.g. controller action <-> view)
  --   :Emodel / :Eview / :Econtroller / :Emigration / ...  edit a file by type
  --   gf                 follows partials, routes, associations, etc.
  -- projectionist powers the :A/:E* jumps; bundler makes `gf` and `:Rails`
  -- aware of bundled gem paths.
  {
    "tpope/vim-rails",
    dependencies = {
      "tpope/vim-projectionist",
      "tpope/vim-bundler",
    },
    ft = { "ruby", "eruby", "haml", "slim" },
    cmd = { "Rails", "A", "AV", "AS", "AT", "R", "RV", "RS", "RT" },
    init = function()
      -- vim-rails fires `User Rails` for every buffer it detects as part of a
      -- Rails app. Set the goto-style mappings buffer-locally there so they
      -- only shadow the built-in `g` keys inside Rails projects.
      vim.api.nvim_create_autocmd("User", {
        pattern = "Rails",
        callback = function(ev)
          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
          end
          map("ga", "<cmd>A<cr>", "Rails: alternate file (impl <-> test)")
          map("gR", "<cmd>R<cr>", "Rails: related file (controller <-> view)")
          map("gm", "<cmd>Emodel<cr>", "Rails: go to model")
          map("gC", "<cmd>Econtroller<cr>", "Rails: go to controller")
          map("gV", "<cmd>Eview<cr>", "Rails: go to view")
        end,
      })
    end,
  },
}
