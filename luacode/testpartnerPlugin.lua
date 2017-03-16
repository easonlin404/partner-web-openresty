local testpartnerPlugin = ...

local P = {}
P.version = "1.0.0"
_G[testpartnerPlugin] = P

package.loaded[testpartnerPlugin] = P

function P.access()
    ngx.log(ngx.DEBUG, "Process testpartner request")
	
	local res = ngx.location.capture("/internal/admin/partners/general/userProvision",
	 	{ method = ngx.HTTP_POST } )

	ngx.header.content_type = "application/json"

	ngx.say(res.body)
end