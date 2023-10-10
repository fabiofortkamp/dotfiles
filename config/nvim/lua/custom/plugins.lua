-- table of plugins that are returned and loaded by chadrc.lua
-- keep in mind that, in Lua, 'tables' can be 1D arrays or dicts;
-- in the case below, we have a list of dicts, with the GitHub repo
-- as the 'head' of each dict; I suppose the keys are required by each plugin
local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_initialized["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
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
        "black",
        "pyright",
        "mypy",
        "ruff",
        "debugpy",
      },

    },
  }
}
return plugins
