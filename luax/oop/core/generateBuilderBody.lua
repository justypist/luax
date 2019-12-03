--[[
    generateBuilderBody
    生成builder主体
]]
local KW = import("KW")
local generateBuilderBody = function(ParentClass,ClassName)
    local builder={}
    builder[KW.METAFIELD]={}
    builder[KW.METAFIELD]["__index"]={}
    builder[KW.METAFIELD][KW.ATTRIBUTE]={}
    builder[KW.STATIC]={}
    builder[KW.PARENT]=ParentClass
    builder[KW.CLASSNAME]=ClassName
    -- 继承
    setmetatable(builder[KW.METAFIELD]["__index"],getmetatable(ParentClass))
    return builder
end
return generateBuilderBody;
