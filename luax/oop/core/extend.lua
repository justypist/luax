--[[
    extend
    继承
]]
local extend = function(body,ParentClass)
    return setmetatable(body,ParentClass==nil and nil or getmetatable(ParentClass))
end
return extend
