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
            -- 将静态属性作为class主体
            local class = builder[KW.STATIC]
            -- 获取父类
            local parentClass = builder[KW.PARENT]
            -- 为class主体添加元表（赋予Class特性）
            setmetatable(class,builder[KW.METAFIELD])
            -- 提取构造函数
            local constructor = builder[KW.METAFIELD]["__call"] or Noop
            -- 装饰构造函数
            builder[KW.METAFIELD]["__call"] = function(class,...)
                -- 获取父类中的属性
                local parentAttr = (getmetatable(parentClass) or {})[KW.ATTRIBUTE] or {}
                -- 获取当前类的属性
                local thisatr = clone(builder[KW.METAFIELD][KW.ATTRIBUTE])
                -- 将父类属性与当前类属性整合为完整的类属性
                local this = clone(parentAttr)
                foreach(thisatr,function(v,k)this[k]=v;end)
                -- 调用构造函数 this为对象完整属性，此时其不具备对象方法
                constructor(this,...)
                -- 赋予对象方法
                setmetatable(this,builder[KW.METAFIELD])
                -- 返回完整的对象实例
                return this
            end
            return class
        end
    }
}
return builderMethod
