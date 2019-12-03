--[[
    builderMethod
    构造器方法
]]
local foreach = import("../../common/functional/foreach")
local clone = import("../../common/base/clone")
local Noop = import("../../common/base/Noop")
local KW = import("KW")
local builderMethod = {
    __index={
        attr=function(builder,attrName,attrValue)
            builder[KW.METAFIELD][KW.ATTRIBUTE][attrName]=attrValue
            return builder
        end,
        method=function(builder,fnName,fnBody)
            builder[KW.METAFIELD]["__index"][fnName]=fnBody
            return builder
        end,
        meta=function(builder,metaName,metaValue)
            assert(metaName~="__index" and metaName~="__call","禁止直接修改__index/__call字段",2)
            builder[KW.METAFIELD][metaName]=metaValue
            return builder
        end,
        static=function(builder,staticName,staticValue)
            builder[KW.STATIC][staticName]=staticValue
            return builder
        end,
        constructor=function(builder,fn)
            builder[KW.METAFIELD]["__call"]=fn
            return builder
        end,
        build=function(builder)
            local class = builder[KW.STATIC]
            local parentClass = builder[KW.PARENT]
            setmetatable(class,builder[KW.METAFIELD])
            local constructor = builder[KW.METAFIELD]["__call"] or Noop
            builder[KW.METAFIELD]["__call"] = function(class,...)
                local parentAttr = (getmetatable(parentClass) or {})[KW.ATTRIBUTE] or {}
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
}
return builderMethod
