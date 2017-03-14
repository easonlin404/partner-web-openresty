local telkomselPlugin = ...

local P = {}
P.version = "1.0.0"
_G[telkomselPlugin] = Process

package.loaded[telkomselPlugin] = P

function P.access()
    ngx.log(ngx.DEBUG, "Process telkomselss request")
	local path = ngx.var.request:split(" ")[2]
	ngx.log(ngx.DEBUG, path)

	local body_data = ngx.req.get_body_data()
	ngx.log(ngx.DEBUG, body_data)

	local contentType = ngx.req.get_headers()["Content-Type"]

	-- Call general partners API
	-- To generate custom partnerUserId
	local cellPhone = cjson.new().decode(body_data).cellPhone
	local partnerUserId = "telkomsel-" .. cellPhone


	local res = ngx.location.capture("/internal/admin/partners/general/userProvision",
	 	{ method = ngx.HTTP_POST,
		 	body = '{"cellPhone": "'.. cellPhone ..'","partnerUserId":"'.. partnerUserId .. '"}'  })

	ngx.header.content_type = "application/json"

	ngx.say(res.body)
end