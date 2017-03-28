ngx.log(ngx.DEBUG, "GET /apis/{partner mame} - get specfic partner all customize API")
local path = ngx.var.request:split(" ")[2]
ngx.log(ngx.DEBUG, path)
  
ngx.log(ngx.DEBUG, "Partner: " .. ngx.var.partner)
ngx.say("<p>.GET /apis/{partner mame} - get specfic partner all customize API </p>")




