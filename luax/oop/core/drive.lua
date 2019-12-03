--[[
    ClassBuilder
    对象构造器
]]
local foreach = import("../../common/functional/foreach")
local clone = import("../../common/base/clone")
local Noop = import("../../common/base/Noop")

local KW={
    ATTRIBUTE="__attribute",
    METAFIELD="__metafield",
    STATIC="__static"
}
local drive = function(ParentClass,ClassName)
    local builder={}
    builder[KW.METAFIELD]={}
    builder[KW.METAFIELD]["__index"]={}
    builder[KW.METAFIELD][KW.ATTRIBUTE]={}
    builder[KW.STATIC]={}
    -- 继承
    setmetatable(builder[KW.METAFIELD]["__index"],getmetatable(ParentClass))
    -- dump(builder)
    setmetatable(builder,{
        __index={
            attr=function(builder,attrName,attrValue)
                builder[KW.METAFIELD][KW.ATTRIBUTE][attrName]=attrValue
            end,
            method=function(builder,fnName,fnBody)
                builder[KW.METAFIELD]["__index"][fnName]=fnBody
            end,
            meta=function(builder,metaName,metaValue)
                assert(metaName~="__index" and metaName~="__call","禁止直接修改__index/__call字段",2)
                builder[KW.METAFIELD][metaName]=metaValue
            end,
            static=function(builder,staticName,staticValue)
                builder[KW.STATIC][staticName]=staticValue
            end,
            constructor=function(builder,fn)
                builder[KW.METAFIELD]["__call"]=fn
            end,
            build=function(builder)
                local class = builder[KW.STATIC]
                setmetatable(class,builder[KW.METAFIELD])
                local constructor = builder[KW.METAFIELD]["__call"] or Noop
                builder[KW.METAFIELD]["__call"] = function(class,...)
                    local parentAttr = (getmetatable(ParentClass) or {})[KW.ATTRIBUTE] or {}
                    local thisatr = clone(builder[KW.METAFIELD][KW.ATTRIBUTE])
                    local this = clone(parentAttr)
                    foreach(thisatr,function(v,k)this[k]=v;end)
                    constructor(this,...)
                    setmetatable(this,builder[KW.METAFIELD])
                    return this
                end
                return class
            end
        }
    })
    return builder
end
return drive
