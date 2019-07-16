--[[
    深度克隆
    clone(any):any
]]
local function clone(var)
    if type(var)~="table" then return var end;
    local new={};
    for k,v in pairs(var) do
        rawset(new,k,clone(v));
    end
    return new;
end
return clone;
