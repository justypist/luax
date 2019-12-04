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
Collection:method("foreach",function(this,fn)

end)
return Collection:build()
