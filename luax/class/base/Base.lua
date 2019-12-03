--[[
    Base
    基础对象
]]
local Base = import("../Object"):drive("Base")

Base:attr("value",nil)
Base:constructor(function(this,value)
    this.value = value
end)

return Base:build()
