--[[
    String
    字符串对象
]]
local String = import("Base"):drive("String")

String:attr("value","")
String:constructor(function(this,string)
    this.value = tostring(string) or this.value
end)
String:method("tonumber",function(this)
    return tonumber(this.value)
end)

return String:build()
