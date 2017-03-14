local path = ngx.var.request:split(" ")[2]
ngx.log(ngx.DEBUG, path)

local body_data = ngx.req.get_body_data()
ngx.log(ngx.DEBUG, body_data)

local contentType = ngx.req.get_headers()["Content-Type"]


-- Call general partners API
local res = ngx.location.capture("/internal/admin/partners/general/$2", { method = ngx.HTTP_POST})

ngx.header.content_type = "application/json"
ngx.say(res.body)