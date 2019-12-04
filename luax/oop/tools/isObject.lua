--[[
    isObject
    判断是否为对象
]]
local type,getmetatable = type,getmetatable
local KW = import("../core/KW")
local isObject = function(instance)
    return type(instance)=="table" and getmetatable(instance)~=nil and getmetatable(instance)[KW.ISOBJECT]
end
return isObject
