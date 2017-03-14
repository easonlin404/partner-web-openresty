ngx.log(ngx.DEBUG, "Process general partner request")
local method = ngx.var.request:split(" ")[1]
local url = ngx.var.request:split(" ")[2]
ngx.log(ngx.DEBUG, method)
ngx.log(ngx.DEBUG, url)

local body_data = ngx.req.get_body_data()
local json_data = cjson.new().decode(body_data)

-- check input
if json_data.cellPhone == nil then
    local json = cjson.encode({
    code = "003",
    message = "cellPhone is empty."
    })
    ngx.say(json)
    ngx.exit(ngx.HTTP_OK)
end
if json_data.partnerUserId == nil then
    local json = cjson.encode({
    code = "003",
    message = "partnerUserId is empty."
    })
    ngx.say(json)
    ngx.exit(ngx.HTTP_OK)
end

-- return mock success response
local json = cjson.encode({
    code = "0",
    accountId = "95a8b0b4-1aca-4bcc-b993-3d434d61482a",
    cellPhone = json_data.cellPhone,
    message = "OK."
})

ngx.say(json)