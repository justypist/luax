--[[
    generateBuilderBody
    生成builder主体
]]
local KW = import("KW")
local Noop = import("../../common/base/Noop")
local generateBuilderBody = function(ParentClass,ClassName)
    local builder={}
    -- 元字段 最终会保留作为class元表
    builder[KW.METAFIELD]={}
    -- 类名
    builder[KW.METAFIELD][KW.CLASSNAME]=ClassName
    -- 对象标识符
    builder[KW.METAFIELD][KW.ISOBJECT]=true
    -- 对象方法存储区
    builder[KW.METAFIELD][KW.METHOD]={}
    -- 对象默认构造函数
    builder[KW.METAFIELD][KW.CONSTRUCTOR]=Noop
    -- 对象属性存储区
    builder[KW.METAFIELD][KW.ATTRIBUTE]={}
    -- 父类
    builder[KW.METAFIELD][KW.PARENT]=ParentClass
    -- 静态属性、方法存储区
    builder[KW.STATIC]={}
    -- 继承
    setmetatable(builder[KW.METAFIELD]["__index"],getmetatable(ParentClass))
    return builder
end
return generateBuilderBody;
