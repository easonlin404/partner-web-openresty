local parnterConfig = ...

local P = {}

_G[parnterConfig] = P

package.loaded[parnterConfig] = P


function reload()
  local plugins = "data/partner-api.json"
  local f = io.open(plugins, "rb")
  local content = f:read("*all")
  f:close()
  return content
end


function P.getPartner()
  local json = cjson.new().decode(reload())
  
  local partnerTab

  for _,partner in pairs( json.partner ) do
    if partner["partner-name"] == ngx.var.partner then
      partnerTab = partner
      break
    end
  end
  return partnerTab
end


function P.getApi()
  local json = cjson.new().decode(reload())
  
  local partnerTab = P.getPartner()
  local apiTab
  
  if partnerTab ~= nil then
     for _,api in pairs( partnerTab.api ) do
          if api["api-name"] == ngx.var.apiName then
            apiTab = api
            break
          end
     end
  end
    
  return apiTab
end

