--[[
    深度克隆
    clone(any):any
]]
assert(type,"type 函数缺失")
local function clone(var)
    if type(var)~="table" then return var end;
    local new={};
    for k,v in pairs(var) do
        rawset(new,k,clone(v));
    end
    return new;
end
return clone;
