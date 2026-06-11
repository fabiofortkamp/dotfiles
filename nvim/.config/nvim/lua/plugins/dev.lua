local plugins = {}
local plugins_dir = vim.fn.expand("~/nvim-plugins")
if vim.fn.isdirectory(plugins_dir) == 1 then
  for _, name in ipairs(vim.fn.readdir(plugins_dir)) do
    local path = plugins_dir .. "/" .. name
    if vim.fn.isdirectory(path) == 1 then
      table.insert(plugins, { dir = path })
    end
  end
end
return plugins
