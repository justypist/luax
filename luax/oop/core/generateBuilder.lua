--[[
    ClassBuilder
    对象构造器
]]


local KW = import("KW")
local generateBuilderBody = import("generateBuilderBody")
local builderMethod = import("builderMethod")

local generateBuilder = function(ParentClass,ClassName)
    -- builder body
    local builder = generateBuilderBody(ParentClass,ClassName)
    setmetatable(builder,builderMethod)
    return builder
end
return generateBuilder
