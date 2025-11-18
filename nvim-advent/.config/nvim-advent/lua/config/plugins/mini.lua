-- configurations for https://github.com/nvim-mini/mini.nvim
return {
    {
        'nvim-mini/mini.nvim',
        config = function()
		-- enable icons and git information in the statusline
		require('mini.icons').setup()
		require('mini.git').setup()
	    	local statusline = require 'mini.statusline'
		statusline.setup { use_icons = true }
        end
    }
}
