return {
  -- add catppuccin
  -- Configure LazyVim to load gruvbox
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = "dark"
      require("solarized").setup(opts)
    end,
  },
  {
    "comfysage/evergarden",
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      transparent_background = true,
      variant = "medium", -- 'hard'|'medium'|'soft'
      overrides = {}, -- add custom overrides
    },
  },
  { "shaunsingh/nord.nvim" },
  { "Tsuzat/NeoSolarized.nvim" },
  { "sainnhe/everforest" },
  { "phha/zenburn.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
}
