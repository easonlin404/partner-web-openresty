local cjson = require("cjson")
local xml = require("LuaXML")

function parsingJson(json_text) 
	-- decode json text, todo using value
	local value = cjson.new().decode(json_text)
	
	local response = xml.new("response")

	response.message = xml.new("code")
	response.code = xml.new("code")
	response.data = xml.new("data")

	table.insert(response.message, "OK.")
	table.insert(response.code, "0")
	table.insert(response.data, "data")

	return xml.str(response,0)
end

--return function(request, next_middleware)
--  local response = next_middleware()
--  local root     = parsingJson(response.body)
  --ngx.say('<?xml version="1.0" encoding="UTF-8"?>',)
--  response.body =  xml.str(response,0)
--  response.headers['Content-type'] = 'application/xml'
--  return response
--end