-- Bootstrap lazy.nvim
-- vim.fn is a table of functions that exist in the original vim engine
-- run :echo stdpath("data") to see there neovim finds data files
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- vim.uv (or the deprecated vim.loop) is a neovim library for process and file management
-- so we are check if the path above is not avaiable 
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  -- system call to clone the repo to the data folder deine anove
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    -- this is to actually make the user type something to exit
    vim.fn.getchar()
    os.exit(1)
  end
end
-- Hey! Put the lazypath into the runtimepath (rtp)
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Setup lazy.nvim
require("lazy").setup({
	-- the spec argument is a table of plugins to pass for lazy to setup
	spec = {
	  { "folke/tokyonight.nvim", config = function() vim.cmd.colorscheme "tokyonight" end},
	    -- import your plugins
	    -- { import = "plugins" },
	  },
	  checker = { enabled = true },
})
