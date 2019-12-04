--[[
    getClassName
    获取类名
]]
local KW = import("../core/KW")
local getClassName = function(instance)
    return getmetatable(instance)[KW.CLASSNAME]
end
return getClassName
