ngx.log(ngx.DEBUG, "Partner: " .. ngx.var.partner)
local partner = require("luacode/".. ngx.var.partner .."Plugin")
partner.access()