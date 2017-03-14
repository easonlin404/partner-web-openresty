ngx.log(ngx.DEBUG, "Process new partner request")
local path = ngx.var.request:split(" ")[2]
ngx.log(ngx.DEBUG, path)

-- Call general partners API
-- To generate custom partnerUserId
local cellPhone = cjson.new().decode(ngx.req.get_body_data()).cellPhone
local partnerUserId = "newpartner-" .. cellPhone

-- Step1: Call userProvision partners API
local res1 = ngx.location.capture("/internal/admin/partners/general/userProvision",
 	{ method = ngx.HTTP_POST,
	 	body = '{"cellPhone": "'.. cellPhone ..'","partnerUserId":"'.. partnerUserId .. '"}'  })

local reponseCode = cjson.new().decode(res1.body).code;

if reponseCode == "0" then
	ngx.log(ngx.DEBUG, "Call userProvision userActivation API ")
	-- Step2: Call userActivation partners API
	local res2 = ngx.location.capture("/internal/admin/partners/general/userActivation",
 		{ method = ngx.HTTP_POST,
	 	body = '{"cellPhone": "'.. cellPhone ..'","orderType":"'.. 'new' .. '"}'  })

	ngx.log(ngx.DEBUG, "res2")
	ngx.log(ngx.DEBUG, res2.body)
end

ngx.header.content_type = "application/json"
ngx.say(res1.body)