--[[
    Object
    对象
    最基础的对象
    所有对象的父类
]]
local generateBuilder = import("../oop/core/generateBuilder")
local base = {}
local Object = generateBuilder({},"Object")

-- 派生
Object:method("drive",function(this,ClassName)
    return generateBuilder(this,ClassName)
end)
-- 输出整个对象
Object:method("dump",function(this)
    dump(this)
    return this
end)

-- todo
-- instanceOf
-- getClassName
-- getFullClassName

Object:static("VERSION","1.0.0")

Object = Object:build()
return Object
