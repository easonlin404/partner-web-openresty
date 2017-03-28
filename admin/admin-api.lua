ngx.log(ngx.DEBUG, "Process admin api request")
local path = ngx.var.request:split(" ")[2]
local method = ngx.var.request:split(" ")[1]
ngx.log(ngx.DEBUG, method)
ngx.log(ngx.DEBUG, path)



ngx.log(ngx.DEBUG, "Partner: " .. ngx.var.partner)
ngx.log(ngx.DEBUG, "ApiName: " .. ngx.var.apiName)
ngx.say("<p> .GET /apis/{partner name}/{api name}  - get specfic partner API info </p>")
ngx.say("<p> POST /apis/{partner name}/{api name}  - add partner API </p>")



