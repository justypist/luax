--[[
    getClass
    获取类主体
]]
local KW = import("../core/KW")
local isObject = import("isObject")
local getClass = function(instance)
    return isObject(instance) and getmetatable(instance)[KW.CLASS] or nil
end
return getClass
