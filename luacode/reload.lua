-- Hot reload plugin
--package.loaded["luacode/telkomselPlugin"] = nil
--package.loaded["luacode/otherpartnerPlugin"] = nil
--package.loaded["luacode/newpartnerPlugin"] = nil

local plugins = "luacode/plugins.json"

local f = io.open(plugins, "rb")
local content = f:read("*all")
f:close()

local json = cjson.new().decode(content)

for plugin, filePath in pairs( json ) do
   print(plugin, filePath)
   package.loaded[filePath] = nil

   ngx.say("reload ".. plugin .." success")
end
