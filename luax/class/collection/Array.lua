--[[
    Array
    数组
]]
local Array = import("Collection"):drive("Array")

Array:attr("value",{})
Array:constructor(function(this,value)
    this.value = value or this.value
end)
Array:method("insert",function(this,value)
    table.insert(this.value,value)
    return this
end)
Array:method("remove",function(this,index)
    index = index or #this.value
    if index>#this.value or index<1 then
        error("数组越界,数组长度为"..#this.value.."，而即将去除的索引位置为"..index,2)
    end
    return table.remove(this.value,index)
end)
Array:method("length",function(this)
    return #this.value
end)
Array:method("empty",function(this)
    this.value={}
    return this
end)

return Array:build()
