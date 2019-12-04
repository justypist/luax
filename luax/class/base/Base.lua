--[[
    Base
    基础对象
]]
local Base = import("../Object"):drive("Base")

Base:attr("value",nil)
Base:constructor(function(this,value)
    this.value = value
end)
Base:method("setValue",function(this,value)
    this.value = value
    return this
end)
Base:method("getValue",function(this)
    return this.value
end)

return Base:build()
