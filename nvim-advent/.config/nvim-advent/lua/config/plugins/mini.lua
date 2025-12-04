-- configurations for https://github.com/nvim-mini/mini.nvim
return {
    {
        'nvim-mini/mini.nvim',
        config = function()
		-- Extend and create `a/i` text objects
		require('mini.ai').setup()
		require('mini.operators').setup()
		require('mini.surround').setup()
        end
    }
}
