-- Run and debug individual C++ tests from the buffer.
--
-- neotest-ctest reads the tests CMake registered with `catch_discover_tests()`
-- (or gtest_discover_tests / doctest), so no test-framework-specific glue is
-- needed here. It supports neotest's dap strategy, which means a single failing
-- test can be re-run under codelldb from the summary window.
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "orjangj/neotest-ctest",
    },
    -- stylua: ignore
    keys = {
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
      { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug Nearest" },
    },
    opts = {
      adapters = {
        ["neotest-ctest"] = {},
      },
    },
    config = function(_, opts)
      local adapters = {}
      for name, config in pairs(opts.adapters or {}) do
        adapters[#adapters + 1] = require(name)(config)
      end
      require("neotest").setup(vim.tbl_extend("force", opts, { adapters = adapters }))
    end,
  },
}
