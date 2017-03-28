local myprint = ...

local P = {}

_G[myprint] = P

package.loaded[myprint] = P

function P.print ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

--[[
Auxiliary function to split a string based on a delimiter
   ]]--

function string:split(delimiter)
   local result = { }
   local from = 1
   local delim_from, delim_to = string.find( self, delimiter, from )
   while delim_from do
      table.insert( result, string.sub( self, from , delim_from-1 ) )
      from = delim_to + 1
      delim_from, delim_to = string.find( self, delimiter, from )
   end
   table.insert( result, string.sub( self, from ) )
   return result
end


