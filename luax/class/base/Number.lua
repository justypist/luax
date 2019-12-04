--[[
    Number
    数字
]]
local Number = import("Base"):drive("Number")

Number:attr("value",0)
Number:constructor(function(this,num)
    this.value = tonumber(num)
end)
-- todo
-- 进制转换

Number:method("tostring",function(this)
    return tostring(this.value)
end)
Number:meta("__tostring",function(this)
    return this:tostring()
end)
return Number:build()
