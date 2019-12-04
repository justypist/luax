--[[
    Collection
    容器
]]
local functional = import("../../common/functional/init")

local Collection = import("../Object"):drive("Collection")
Collection:attr("value",{})
Collection:constructor(function(this,value)
    this.value = value or this.value
end)

-- 实例方法
Collection:method("foreach",function(this,fn)
    functional.foreach(this.value,fn)
    return this
end)
Collection:method("map",function(this,fn)
    functional.map(this.value,fn)
    return this
end)
Collection:method("filter",function(this,fn)
    functional.filter(this.value,fn)
    return this
end)
Collection:method("find",function(this,fn)
    return functional.find(this.value,fn)
end)
Collection:method("reduce",function(this,fn)
    return functional.reduce(this.value,fn)
end)
Collection:method("every",function(this,fn)
    return functional.every(this.value,fn)
end)
Collection:method("some",function(this,fn)
    return functional.some(this.value,fn)
end)

-- 静态方法
Collection:static("foreach",functional.foreach)
Collection:static("map",functional.map)
Collection:static("filter",functional.filter)
Collection:static("find",functional.find)
Collection:static("reduce",functional.reduce)
Collection:static("every",functional.every)
Collection:static("some",functional.some)

return Collection:build()
