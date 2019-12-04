--[[
    ClassBuilder
    对象构造器
]]


local KW = import("KW")
local generateBuilderBody = import("generateBuilderBody")
local builderMethod = import("builderMethod")

local generateBuilder = function(ParentClass,ClassName)
    -- 构建主体（用于存放Class信息）
    local builder = generateBuilderBody(ParentClass,ClassName)
    -- 为主体添加方法
    setmetatable(builder,builderMethod)
    return builder
end
return generateBuilder
