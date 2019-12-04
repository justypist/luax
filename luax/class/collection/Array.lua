--[[
    Array
    数组
]]
local Array = import("Collection"):drive("Array")

Array:attr("value",{})
Array:constructor(function(this,value)
    this.value = value or this.value
end)
Array:method("get",function(this,index)
    return this.value[index]
end)
Array:method("insert",function(this,index,value)
    if value==nil then
        table.insert(this.value,index)
    else
        table.insert(this.value,index,value)
    end
    return this
end)
Array:method("remove",function(this,index)
    index = index or #this.value
    if index>this:length() or index<1 then
        error("数组越界,数组长度为"..#this.value.."，而即将去除的索引位置为"..index,2)
    end
    return table.remove(this.value,index)
end)
Array:method("length",function(this)
    return #this.value
end)
Array:method("clear",function(this)
    this.value={}
    return this
end)
-- 栈操作
Array:method("push",function(this,value)
    return this:insert(value)
end)
Array:method("pop",function(this)
    return this:remove()
end)
-- 队列操作
Array:method("enqueue",function(this,value)
    this.push(value)
    return this
end)
Array:method("dequeue",function(this)
    return this:remove(1)
end)
Array:method("isEmpty",function(this)
    return this:length()==0
end)
Array:method("first",function(this)
    return this:get(1)
end)
Array:method("last",function(this)
    return this:get(this:length())
end)

-- 数组元素合并为字符串
Array:method("join",function(this,delimiter,left,right)
    delimiter = delimiter or ','
    return table.concat(this.value,delimiter,left,right)
end)

return Array:build()
