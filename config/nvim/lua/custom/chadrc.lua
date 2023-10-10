---@type ChadrcConfig
local M = {}

-- it is customary to create a "configurations table called M, that is to be 
-- populated with fields as below
--
-- this table is returned and consumed by the nvChad configuration engine
M.ui = { theme = 'catppuccin' }
M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'
return M
