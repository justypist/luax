--[[
    Object
    对象
    最基础的对象
    所有对象的父类
]]
local drive = import("../oop/core/drive")
local base = {}
local Object = drive({},"Object")

-- 派生
Object:method("drive",function(this,ClassName)
    return drive(this,ClassName)
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

Object = Object:build()
return Object
