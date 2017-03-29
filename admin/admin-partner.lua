local config = require("admin/partner-config")

ngx.log(ngx.DEBUG, "GET /apis/{partner mame} - get specfic partner all customize API")
local path = ngx.var.request:split(" ")[2]
ngx.log(ngx.DEBUG, path)
  
ngx.log(ngx.DEBUG, "Partner: " .. ngx.var.partner)

ngx.header.content_type = "application/json"

local partnerTab =config.getPartner(ngx.var.partner)

if partnerTab == nil then
  local json = cjson.encode({
    message = "can not find " .. ngx.var.partner
  })
ngx.say(json)
return
else
  ngx.say( cjson.encode(partnerTab))
end