ngx.log(ngx.DEBUG, "get all customize API info")
local path = ngx.var.request:split(" ")[2]
ngx.log(ngx.DEBUG, path)
  

ngx.say("<p> GET /apis - get all customize API info </p>")




