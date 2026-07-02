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
  },
}
