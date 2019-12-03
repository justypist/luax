--[[
    Number
    数字
]]
local Object = import("../Object")
local Number = Object:drive("Number")
Number:attr("value",0)
Number:constructor(function(this,num)
    this.value = tonumber(num)
end)

Number:method("toString",function(this)
    return tostring(this.value)
end)
return Number:build()
