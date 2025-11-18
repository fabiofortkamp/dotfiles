-- configurations for https://github.com/nvim-mini/mini.nvim
return {
    {
        'nvim-mini/mini.nvim',
        config = function()
            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = true }
        end
    }
}
