local otherpartnerPlugin = ...

local P = {}

_G[otherpartnerPlugin] = Process

package.loaded[otherpartnerPlugin] = P

function P.access()
    ngx.log(ngx.DEBUG, "Process other partner request")
	local path = ngx.var.request:split(" ")[2]
	ngx.log(ngx.DEBUG, path)

	local cellPhone =  ngx.var.arg_cellPhone or "default cellPhone"
	local partnerUserId = ngx.var.arg_partnerUserId or "default partnerUserId"

	-- Call general partners API
	local res = ngx.location.capture("/internal/admin/partners/general/userProvision",
	 	{ method = ngx.HTTP_POST,
		 	body = '{"cellPhone": "'.. cellPhone ..'","partnerUserId":"'.. partnerUserId .. '"}'  })

	ngx.header.content_type = "application/json"
	ngx.say(res.body)
end