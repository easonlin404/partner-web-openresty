ngx.log(ngx.DEBUG, "GET /apis/{partner mame} - get specfic partner all customize API")
local path = ngx.var.request:split(" ")[2]
ngx.log(ngx.DEBUG, path)
  
ngx.log(ngx.DEBUG, "Partner: " .. ngx.var.partner)

ngx.header.content_type = "application/json"

local plugins = "data/partner-api.json"

local f = io.open(plugins, "rb")
local content = f:read("*all")
f:close()

local json = cjson.new().decode(content)


local partnerTab

for _,partner in pairs( json.partner ) do
  if partner["partner-name"] == ngx.var.partner then
    partnerTab = partner
    break
  end
end

if partnerTab == nil then
  local json = cjson.encode({
    message = "can not find " .. ngx.var.partner
  })
ngx.say(json)
return
else
  ngx.say( cjson.encode(partnerTab))
end