local plugins = {}
local Path = require("pathlib")
local plugins_dir = Path("~") / "nvim-plugins"
for this_plugin in plugins_dir:fs_iterdir(false, 1, nil) do
  local plugin = {
    dir = this_plugin,
  }
  table.insert(plugins, plugin)
end
return plugins
