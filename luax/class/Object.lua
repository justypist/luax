--[[
    Object
    对象
    最基础的对象
    所有对象的父类
]]
local generateBuilder = import("../oop/core/generateBuilder")
local base = {}
local Object = generateBuilder(nil,"Object")
local getClassName = import("../oop/tools/getClassName")
local getClass = import("../oop/tools/getClass")
local getParent = import("../oop/tools/getParent")
local clone = import("../common/base/clone")
local extend = import("../oop/core/extend")
local find = import("../common/functional/find")

-- 派生
Object:method("drive",function(this,ClassName)
    return generateBuilder(this,ClassName)
end)
-- 输出整个对象
Object:method("dump",function(this)
    dump(this)
    return this
end)
-- 获取类名
Object:method("getClassName",function(this)
    return getClassName(this)
end)
-- 获取完整类名
Object:method("getFullClassName",function(this)
    return
            this:getParent()~=nil
        and
            this:getParent():getFullClassName().."."..this:getClassName()
        or
            this:getClassName()
end)
-- 获取父类
Object:method("getParent",function(this)
    return getParent(this)
end)
-- 克隆对象自身
Object:method("clone",function(this)
    return extend(clone(this),this)
end)
-- 获取所有父类的数组
Object:method("getParents",function(this)
    local parents = {}
    local parent = this:getClass()
    while parent do
        table.insert(parents,parent)
        parent = parent:getParent()
    end
    return parents
end)
-- 获取自身Class
Object:method("getClass",function(this)
    return getClass(this)
end)
-- 判断是否属于某个Class
Object:method("instanceOf",function(this,parentClass)
    return find(this:getParents(),function(v)
        return v==parentClass
    end) and true or false
end)
-- 判断相等
Object:method("equal",function(this,instance)
    return this == instance
end)

-- 静态属性
-- 版本
Object:static("VERSION","1.0.0")

return Object:build()
