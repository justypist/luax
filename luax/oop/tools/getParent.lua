--[[
    getParent
    获取父类
]]
local KW = import("../core/KW")
local isObject = import("isObject")
local getParent = function(class)
    return isObject(class) and getmetatable(class)[KW.PARENT] or nil
end
return getParent
