--[[
    存在
    some(table,(any,string|number,table)=>boolean):boolean
]]
local function some(tbl,callback)
    for key,value in pairs(tbl) do
        if callback(value,key,tbl) then return true end;
    end
    return false;
end
return some;
