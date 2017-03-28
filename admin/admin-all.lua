local plugins = "data/plugins.json"

ngx.log(ngx.DEBUG, "get all customize API info")
local path = ngx.var.request:split(" ")[2]
ngx.log(ngx.DEBUG, path)
  

local plugins = "data/partner-api.json"

local f = io.open(plugins, "rb")
local content = f:read("*all")
f:close()



ngx.header.content_type = "application/json"

ngx.say(content)

