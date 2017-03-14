ngx.log(ngx.DEBUG, "Process general partner request")

-- return mock success response
local json = cjson.encode({
    code = "004",
    message = "OK."
})
ngx.say(json)