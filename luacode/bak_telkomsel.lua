-- Import requrie lib
xml = require("LuaXML")
--xml_to_json = require("xml-to-json")
--xml_to_json(request, next_middleware);

json_to_xml = require("luacode/json-to-xml")


local path = ngx.var.request:split(" ")[2]

ngx.log(ngx.DEBUG, path)

local body_data = ngx.req.get_body_data()
ngx.log(ngx.DEBUG, body_data)

local contentType = ngx.req.get_headers()["Content-Type"]

--- Input Formatter
if contentType == "application/json" then
	ngx.log(ngx.DEBUG, "[JSON INPUT]")
elseif contentType == "application/xml" then
	ngx.log(ngx.DEBUG, "[Parsing XML format]")
	
	local txml = xml.eval(body_data)
	ngx.log(ngx.DEBUG, txml)

	for _, node in pairs(txml:find("application_id")) do
    	if node.TAG ~= nil then
    		ngx.log(ngx.DEBUG, _)
        	ngx.log(ngx.DEBUG, node)
    	end
	end

else
	ngx.status = ngx.HTTP_FORBIDDEN  --(403)
	ngx.say("forbidden")
    ngx.exit(ngx.HTTP_OK)
end


local res = ngx.location.capture("/internal/admin/partners/$1/$2")

if contentType == "application/json" then	
	local value = cjson.new().decode(res.body)
	ngx.header.content_type = contentType
	ngx.say(res.body)

elseif contentType == "application/xml" then
	local value = cjson.new().decode(res.body)
	local response = xml.new("response")
	response.message = xml.new("code")
	response.code = xml.new("code")
	response.data = xml.new("data")

	table.insert(response.message, "OK.")
	table.insert(response.code, "0")
	table.insert(response.data, "data")

	res.header["Content-type"] = 'application/xml'
	ngx.header.content_type = res.header["Content-type"];
	ngx.say('<?xml version="1.0" encoding="UTF-8"?>', xml.str(response,0))

else
	ngx.status = ngx.HTTP_FORBIDDEN  --(403)
	ngx.say("forbidden")
    ngx.exit(ngx.HTTP_OK)
end






--if path[0] == "GET" then
-- 		ngx.status = 410
 --       ngx.say("this is my own error page content")
 --       ngx.exit(ngx.OK)
--else
--  print('x is non-negative')

--end



	





