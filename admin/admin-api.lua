local config = require("admin/partner-config")

ngx.log(ngx.DEBUG, "Process admin api request")
local path = ngx.var.request:split(" ")[2]
local method = ngx.var.request:split(" ")[1]
ngx.log(ngx.DEBUG, method)
ngx.log(ngx.DEBUG, path)

ngx.log(ngx.DEBUG, "Partner: " .. ngx.var.partner)
ngx.log(ngx.DEBUG, "ApiName: " .. ngx.var.apiName)

if method == "GET" then
  ngx.header.content_type = "application/json"


  local apiTab =config.getApi()
 
  
  if apiTab == nil then
    local json = cjson.encode({
      message = "can not find " .. ngx.var.partner .." ,api:" .. ngx.var.apiName
    })
  ngx.say(json)
  return
  else
    ngx.say( cjson.encode(apiTab))
  end

elseif method == "POST" then
  ngx.say("<p> POST /apis/{partner name}/{api name}  - add partner API </p>")
end









