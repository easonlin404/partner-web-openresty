local parnterConfig = ...

local P = {}

_G[parnterConfig] = P

package.loaded[parnterConfig] = P


-- gloabl 
local g_configTab

function P.preload()
  local plugins = "data/partner-api.json"
  local f = io.open(plugins, "rb")
  local content = f:read("*all")
  f:close()

  g_configTab = cjson.new().decode(content)

end

function reload()
  local plugins = "data/partner-api.json"
  local f = io.open(plugins, "rb")
  local content = f:read("*all")
  f:close()
  return content
end


function P.getPartner(p)
  local json = cjson.new().decode(reload())
  
  local partnerTab

  for _,partner in pairs( json.partner ) do
    if partner["partner-name"] == p then
      partnerTab = partner
      break
    end
  end
  return partnerTab
end


function P.getApi(partner,a)
  local json = cjson.new().decode(reload())
  
  local partnerTab = P.getPartner(partner)
  local apiTab
  
  if partnerTab ~= nil then
     for _,api in pairs( partnerTab.api ) do
          if api["api-name"] == a then
            apiTab = api
            break
          end
     end
  end
    
  return apiTab
end


function P.getApipath(path)
  
end

