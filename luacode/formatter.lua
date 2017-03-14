xml = require("LuaXML")

ngx.log(ngx.DEBUG, 'processing formatter.lua')

local cjson = require("cjson") -- cjson is a global variable


local res = ngx.location.capture("/test")
local value = cjson.new().decode(res.body)

local response = xml.new("response")

response.word = xml.new("word")
response.timestamp = xml.new("timestamp")
table.insert(response.word, value.code)
table.insert(response.timestamp, os.date())


ngx.header.content_type = 'application/xml';

ngx.say('<?xml version="1.0" encoding="UTF-8"?>', xml.str(response,0))