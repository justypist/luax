--[[
    String
    字符串对象
]]
local Object = import("../Object")
local String = Object:drive("String")

String:attr("value","")
String:constructor(function(this,string)
    this.value = string or this.value
end)

return String:build()
