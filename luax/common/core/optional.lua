--[[
    可选
    optional(!nil,string):!nil
]]
local function optional(item,name)
    assert(item~=nil,"optional["..name.."] not exist")
    return item;
end
return optional;
