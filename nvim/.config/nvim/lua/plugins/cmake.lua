-- Drive CMake from inside Neovim: configure, build, run and debug without
-- dropping to a shell. Understands CMakePresets.json, which is what
-- `new-cpp-project` scaffolds.
return {
  "Civitasv/cmake-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "c", "cpp", "cmake" },
  cmd = {
    "CMakeGenerate",
    "CMakeBuild",
    "CMakeRun",
    "CMakeDebug",
    "CMakeSelectBuildPreset",
    "CMakeSelectConfigurePreset",
  },
  -- stylua: ignore
  keys = {
    { "<leader>mg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
    { "<leader>mb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
    { "<leader>mr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
    { "<leader>md", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
    { "<leader>mt", "<cmd>CMakeRunTest<cr>", desc = "CMake Run Tests" },
    { "<leader>mp", "<cmd>CMakeSelectConfigurePreset<cr>", desc = "CMake Select Preset" },
    { "<leader>mc", "<cmd>CMakeClean<cr>", desc = "CMake Clean" },
  },
  opts = {
    cmake_command = "cmake",
    ctest_command = "ctest",
    cmake_build_directory = "build/${variant:buildType}",
    -- clangd only finds a project's compile flags if compile_commands.json sits
    -- at the project root, but CMake writes it into the build directory. This
    -- symlink is the single most common reason C++ LSP "just doesn't work".
    cmake_soft_link_compile_commands = true,
    cmake_compile_commands_from_lsp = false,
    cmake_dap_configuration = {
      name = "cpp",
      type = "codelldb",
      request = "launch",
      stopOnEntry = false,
      runInTerminal = true,
      console = "integratedTerminal",
    },
  },
}
