return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
	  "folke/lazydev.nvim",
	  ft = "lua", -- only load on lua files
	  opts = {
	    library = {
	      -- See the configuration section for more details
	      -- Load luvit types when the `vim.uv` word is found
	      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	    },
	  },
	},
    },
      config = function()
	-- server configurations
	vim.lsp.enable("lua_ls")

	-- in nvim 0.11+, the virtual lines have to be turned on
	vim.diagnostic.config({
	   virtual_lines = true,

	})
      end,
  },
}
