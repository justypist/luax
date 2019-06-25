--[[
    every(table,(any,string|number,table)=>boolean):boolean
]]
local function every(tbl,callback)
    for key,value in pairs(tbl) do
        if not callback(value,key,tbl) then return false end;
    end
    return true;
end
return every;
